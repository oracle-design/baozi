# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

NB_USERS = 20

NB_USERS.times do |n|
  User.create! do |a|
    a.email = "user_" + n.to_s + "@pick.chat.com"
    a.password = a.password_confirmation = '12345678'
    a.username = Faker::Name.name + n.to_s
  end
end