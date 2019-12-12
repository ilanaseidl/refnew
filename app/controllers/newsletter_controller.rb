class NewsletterController < ApplicationController

  def sign_up
    @user = User.new
    @id = params[:id]
  end

  def submit
    #@id = params[:id]

  #  @id = 1 if params[:id] == nil
    email = params[:user][:email]
    @user = User.new(email: email, counter: 0)

    if @user.save
      cookies[:h_email] = {value: @user.email}

      #Updates the referrals table
      #@referral = Referral.new(referrer: @id, referredby_id: @user.id)

      if params[:id]
        @referral = Referral.new(referrer: params[:id], referred: @user.id)
        @referral.save!

        #Updates the referrer's counter
        @referrer_user = User.find(params[:id])
        @referrer_user.update(counter: @referrer_user.counter+1)
      end


      #Directs to succes page
      redirect_to "/newsletter/success/#{@user.id}"
    else
      logger.info("Error saving user with email, #{email}")
      redirect_to root_path, alert: 'Something went wrong!'
    end
  end

  def success
  end

  def progress
    progress = referrer_user.count_of_referrals
  end
end
