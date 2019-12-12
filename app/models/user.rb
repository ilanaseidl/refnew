class User < ApplicationRecord
<<<<<<< HEAD
  has_many :referrals

  if validates :email, presence: true, length: {maximum: 100},allow_nil: false, format: { with: URI::MailTo::EMAIL_REGEXP }

  else
    puts "invalid email"
  end
=======
  has_many :referrals, counter_cache: :count_of_referrals
  validates :email, uniqueness: true, format: { with: Devise::email_regexp, message: "Invalid email format." }, presence: true

>>>>>>> 68fede90a087736f0e2647ba181962f4566299bd
end
