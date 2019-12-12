class User < ApplicationRecord
  has_many :referrals

  if validates :email, presence: true, length: {maximum: 100},allow_nil: false, format: { with: URI::MailTo::EMAIL_REGEXP }

  else
    puts "invalid email"
  end
end
