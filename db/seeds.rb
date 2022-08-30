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

emails = ["test@test.com", "carlos.baez.fumero@gmail.com", "x.briglmeier@gmail.com", "szczepanowska.n@gmail.com",
          "luizrmiug@gmail.com"]

# generate random users
puts "Creating users..."
emails.each do |email|
  user = User.create(email: email, password: "123456", user_name: Faker::Name.first_name)
  puts "Created #{user.user_name}"

  puts "Creating goals..."
  5.times do
    goal = Goal.create(name: Faker::Sports::Football.team, description: Faker::Address.full_address, category: "Diet", status: "In Progress", user: user)
    puts "Created #{goal.name}"

    puts "Creating tasks..."
    5.times do
      Task.create(name: Faker::Sports::Football.player, description: Faker::Address.full_address, status: "In Progress", goal: goal)
      puts "Created #{task.name}"
    end
  end
end

puts "Finished!"
