# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
Bag.destroy_all
Order.delete_all
Food.delete_all

require 'set'

s = Set.new []
30.times do
  s.add Faker::Food.ingredient
end

s.each do |n|
  Food.create(ingredient:n)
end

10.times do
  User.create(name: Faker::Name.name, email: Faker::Internet.email, zipcode: Faker::Address.zip_code, password: 'asdf', password_confirmation: 'asdf',
    is_hunter: Faker::Boolean.boolean, avatar: Faker::Avatar.image)
end

User.all.each do |user|
  if user.is_hunter == false
    random = Faker::Number.between(1,3)
    random.times do
      user.bags.create(
        name: Faker::Team.creature, estimated_price: Faker::Number.decimal(2),
        comments: Faker::SlackEmoji.food_and_drink)
    end
  end
end

Bag.all.each do |bag|
  Faker::Number.between(1,11).times do
    random = Faker::Number.between(1,10)
    bag.orders.create(
      food_id:random, quantity:Faker::Number.between(1,10))
  end
end
