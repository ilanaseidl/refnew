class User < ApplicationRecord
  has_many :referrals
  validates :email, presence: true, 'valid_email_2/email': true
end
