class User < ApplicationRecord
  has_many :referrals, counter_cache: :count_of_referrals
  devise :registerable, :trackable #record ip address upon sign in
  #email verification
  validates :email, uniqueness: true, format: { with: Devise::email_regexp, message: "Invalid email format." }, presence: true
  validates :current_sign_in_ip, uniqueness: true #validates that ip address is new
end
