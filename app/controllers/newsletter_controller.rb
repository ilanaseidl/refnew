class NewsletterController < ApplicationController
  before_action :check_session, only: :sign_up

  def sign_up
    @user = User.new
    @id = params[:id]
  end

  def submit
    email = params[:user][:email]
    @user = User.new(email: email, counter: 0)


    if @user.save
      cookies[:id] = @user.id
      
      if params[:id]
        @referral = Referral.new(referrer: params[:id], referred: @user.id)
        @referral.save!

        #Update referrer's counter
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

  def check_session
    if cookies[:id] && User.where(id: cookies[:id]).any? && !admin_user
      redirect_to "/newsletter/success/#{@user.id}"
    end
  end

end
