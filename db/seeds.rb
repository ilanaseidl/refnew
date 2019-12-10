# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
