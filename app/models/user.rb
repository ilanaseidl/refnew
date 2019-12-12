class User < ApplicationRecord
  has_many :referrals
  validates :email, uniqueness: true, format: { with: Devise::email_regexp, message: "Invalid email format." }, presence: true

end
