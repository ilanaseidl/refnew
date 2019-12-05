class ReferralsController < ApplicationController
  def index
    @user = User.all
    @referral = Referral.all
  end
end
