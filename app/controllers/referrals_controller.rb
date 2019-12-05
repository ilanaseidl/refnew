class ReferralsController < ApplicationController

  http_basic_authenticate_with name: "reftracker", password: "password",
  only: :index

  def index
    @user = User.all
    @referral = Referral.all
  end
end
