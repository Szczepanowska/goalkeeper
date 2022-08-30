# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "open-uri"

User.destroy_all
Goal.destroy_all
Task.destroy_all

# generate random users
puts "Creating users..."
5.times do
  user = User.create(email: Faker::Internet.email, password: "123456", user_name: Faker::Name.first_name)
  puts "Created #{user.user_name}"
end

puts "Finished!"
# , last_name: Faker::Name.last_name

# generate random meals
puts "Creating goals..."
5.times do
  goal = Goal.create(name: Faker::Sports::Football.team, description: Faker::Address.full_address, category: "Diet", status: "In Progress", user: User.all.sample)
  puts "Created #{goal.name}"
end

puts "Creating tasks..."
5.times do
  task = Task.create(name: Faker::Sports::Football.player, description: Faker::Address.full_address, status: "In Progress", goal: Goal.all.sample)
  puts "Created #{task.name}"
end

puts "Finished!"
