class NewsletterController < ApplicationController
  def sign_up
    @user = User.new
    @id = params[:id]
  end

  def submit
    @id = params[:id]

    referrer_id = params[:id]

    @id = 1 if params[:id] == nil
    email = params[:user][:email]
    @user = User.new(email: email, counter: 0)

    if @user.save
      cookies[:h_email] = {value: @user.email}

      #Updates the referrals table
      #@referral = Referral.new(referrer: @id, referredby_id: @user.id)

      if referrer_id
        @referral = Referral.new(referrer: params[:id], referred: @user.id)
        @referral.save!

        puts(@id)
        puts(User.find(@id))
        #Updates the referrer's counter

        referrer_user = User.find(referrer_id)
        referrer_user.update(counter: referrer_user.counter+1)
      end
  #    referrerCount = User.find(@id).counter
  #    referrerCount += 1

  #    referrer = User.find(@id)
  #    referrer.update(counter: referrerCount)



      #Directs to succes page
      redirect_to "/newsletter/success/#{@user.id}"
    else
      logger.info("Error saving user with email, #{email}")
      redirect_to "/sign_up/#{@id}", alert: 'Something went wrong!'
    end
  end

  def success
  end
end
