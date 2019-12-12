class User < ApplicationRecord
  has_many :referrals, counter_cache: :count_of_referrals
  validates :email, uniqueness: true, format: { with: Devise::email_regexp, message: "Invalid email format." }, presence: true
  validates :current_sign_in_ip, uniqueness: true
  devise :registerable, :trackable
end
