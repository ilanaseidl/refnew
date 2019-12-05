class NewsletterController < ApplicationController
  def sign_up
    @user = User.new
    @id = params[:id]
  end

  def submit
    @id = params[:id]
    email = params[:user][:email]
    @user = User.new(email: email, counter: 0)

    if @user.save
      cookies[:h_email] = {value: @user.email}

      #Updates the referrer's counter
      referrerCount = User.find(@id).counter
      referrerCount += 1
      referrer = User.find(@id)
      referrer.update(counter: referrerCount)

      #Updates the referrals table
      @referral = Referral.new(referrerID: @id, referredby_id: @user.id)
      @referral.save

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
