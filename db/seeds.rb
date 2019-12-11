require 'faker'

default_users = [{:email => 'a@a.com', :counter => 3},
	{:email => 'ab@a.com', :counter => 33},
	{ :email => 'ac@a.com', :counter => 34}
]

default_users.each do |user|
	User.create!(user)
end

default_referrals = [{:referrer => 1, :referred => 2},
  {:referrer => 2, :referred => 3}
]

default_referrals.each do |referral|
	Referral.create!(referral)
end

1000.times do
User.create!(
  email: Faker::Internet.unique.email,
  counter: Faker::Config.random)
end

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

