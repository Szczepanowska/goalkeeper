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

users = [
  {
    email: "carlos.baez.fumero@gmail.com",
    user_name: "carlosbaezfumero",
    image: "carlos.png",
    goals: [
      {
        name: "Lose weight",
        description: "Pants don't fit anymore",
        category: "Health",
        task: [
          "Go to the gym",
          "Run 5 miles",
          "Count calories"
        ]
      },
      {
        name: "Play football",
        description: "Have some fun playing football again",
        category: "Sport",
        task: [
          "Sign up for an amateur game",
          "Watch tutorial on how to play football",
          "Buy a football"
        ]
      },
      {
        name: "Surprise my sister with a birthday party",
        description: "Make her day special",
        category: "Lifestyle",
        task: [
          "Create a WhatsApp group, and invite friends",
          "Order a cake with heart format",
          "Buy her present"
        ]
      },
      {
        name: "Start a JavaScript course",
        description: "Improve my skills",
        category: "Education",
        task: [
          "Search for a school",
          "Apply for the course",
          "Ask for holidays at work"
        ]
      },
      {
        name: "Invest some money",
        description: "To use wisely the money I got from loto",
        category: "Finances",
        task: [
          "Search for a website of investments",
          "Watch some tutorial videos on Youtube",
          "Find the best currency"
        ]
      },
      {
        name: "Update my CV",
        description: "To start applying for new Jobs",
        category: "Career",
        task: [
          "Search for a good CV layout",
          "Update my LinkedIn",
          "Check on some tutorial videos"
        ]
      },
      {
        name: "Plan my 2024-Holidays in Brazil",
        description: "To enjoy the best Canaval of the world",
        category: "Lifestyle",
        task: [
          "Get some tips from my Brazilian friends",
          "Book tickets",
          "Book hotel"
        ]
      },
      {
        name: "Start writing a diary",
        description: "Increasing my self-knowledge",
        category: "Growth",
        task: [
          "Buy a nice diary",
          "Buy new pencils",
          "Write for a whole week without skiping a day"
        ]
      },
      {
        name: "Look for  some food suplements",
        description: "To find a new way to be healthy",
        category: "Health",
        task: [
          "Look for some infos on internet",
          "Make an appointment with a doctor",
          "Buy the suplement"
        ]
      },
      {
        name: "Write a professional plan",
        description: "Need to focus on what I want for my professional life",
        category: "Career",
        task: [
          "Make a list of jobs",
          "Find a nice coach",
          "Write a personal text for myself in 10 years"
        ]
      },
      {
        name: "Start on a diet",
        description: "To help to lose some weight",
        category: "Health",
        task: [
          "Book a nutri",
          "Find a nice gym coach",
          "Buy vegetables, and fruits"
        ]
      },
    ]
  },

  {
    email: "x.briglmeier@gmail.com",
    user_name: "Xaver B",
    image: "xaver.jpg",
    goals: [
      {
        name: "Drink More Water",
        description: "Keep myself hydrated",
        category: "Health",
        task: [
          "Drink 2 liters of water per day",
          "Buy a refillable bottle",
          "Download an app to track water intake"
        ]
      },
      {
        name: "Eat less sugar",
        description: "Be healthier with eating choices",
        category: "Health",
        task: [
          "Stop buying M&M's at the supermaket",
          "Replace industrial sugars with fruits",
          "Sugar cheat day on Fridays"
        ]
      },
      {
        name: "Learn Portuguese",
        description: "To spend a time with Goalkeepers team in Brazil",
        category: "Education",
        task: [
          "Search for a online school",
          "Make a replecement test",
          "Start studying"
        ]
      },
      {
        name: "Write my 2023 year plan",
        description: "To organize my personal projects for next year",
        category: "Growth",
        task: [
          "Buy a nice notebook",
          "Buy new pencils",
          "Write all my plans"
        ]
      },
      {
        name: "Write a Formula-1 blog",
        description: "Use my skills to freelance a cool project",
        category: "Hobbys",
        task: [
          "Search for nice articles",
          "Develope a webpage",
          "Write week plans"
        ]
      },
      {
        name: "Start a C++ Online-Kurse",
        description: "To get advanced skills",
        category: "Education",
        task: [
          "Look for some online plataforms",
          "Make a list of the best 5 courses",
          "Pay, and start the course"
        ]
      },
      {
        name: "Reading more newspaper",
        description: "To increase critical skills",
        category: "Growth",
        task: [
          "Sign-up a online newspaper",
          "Read every day for a whole week",
          "Start taking notes of nice articles"
        ]
      },
      {
        name: "Freelance a new web development project",
        description: "To increase critical skills",
        category: "Career",
        task: [
          "Search for some opportunities on Slack channel",
          "Apply and talk to people",
          "Show my portfolio"
        ]
      },
      {
        name: "Start yoga or some relax activity",
        description: "To find a moment to relax during work-days",
        category: "Hobbys",
        task: [
          "Search for some opportunities on Slack channel",
          "Apply and talk to people",
          "Show my portfolio"
        ]
      },
      {
        name: "Save money for Christmas trip",
        description: "Organize eveything to have a nice time with family",
        category: "Finances",
        task: [
          "Open a savings account at Commerzbank",
          "Put 10 euros every day in a Jar",
          "Open a excel sheet to write every saving"
        ]
      },
    ]
  },

  {
    email: "szczepanowska.n@gmail.com",
    user_name: "Natalia SZCZCSZCZS",
    image: "natalia.jpg",
    goals: [
      {
        name: "Becoming Web Developer",
        description: "Bored with a customer service, looking for adventures 🚀",
        category: "Career",
        task: [
          "Start with online free courses",
          "Sign up to Le Wagon",
          "Do flashcards"
        ]
      },
      {
        name: "Prepare Christmas gifts",
        description: "Trying to avoid december shoping rush",
        category: "Lifestyle",
        task: [
          "Check Amazon",
          "Tell kids to write christmas list",
          "Buy wrapping paper"
        ]
      },
      {
        name: "Start my E-learning platform",
        description: "To help people struggling at learning new skills",
        category: "Growth",
        task: [
          "Write a plan",
          "Make a schema on Figma",
          "Look for some other developers to hire"
        ]
      },
    ]
  },
  {
    email: "luizrmiug@gmail.com",
    user_name: "luiz",
    image: "luiz.jpg",
    goals: [
      {
        name: "Save some money",
        description: "Need to save for 2023 Holidays",
        category: "Finances",
        task: [
          "Put 1 euro in a jar every day",
          "Chech bank statement",
          "Stop ordering food"
        ]
      },
      {
        name: "Start playing chess",
        description: "Learn how to play the game",
        category: "Hobbys",
        task: [
          "Watch youtube tutorials",
          "Buy chess board",
          "Invite Friends to come over"
        ]
      },
      {
        name: "Continue learning Italian",
        description: "To achieve B2 level proficience",
        category: "Education",
        task: [
          "Look for a nice and fun online course",
          "Find a partner to speak Italian",
          "Write my studies plan for the next months"
        ]
      },
      {
        name: "Go back to Yoga classes",
        description: "Find a moment to relax, and enjoy more my free time",
        category: "Growth",
        task: [
          "Look for some school in Munich",
          "Ask some friend that may be interested to join me",
          "Buy a new yoga mat"
        ]
      },
      {
        name: "Plan my sister's high school graduation",
        description: "Takes place in 2024",
        category: "Lifestyle",
        task: [
          "Find a nice store for the flowers I'd buy",
          "Make a plan of food for the dinner on the day",
          "Check with her some options of clothes, and colors"
        ]
      },
      {
        name: "Go to a meditation retreat in India",
        description: "Plan it for 2025",
        category: "Growth",
        task: [
          "Look for nice, and safe places",
          "Contact the person responsible for the retreate",
          "Pay for it, and check flight tickets"
        ]
      },
      {
        name: "Buy my grandama's new tv",
        description: "To give her on the grandama's day",
        category: "Finances",
        task: [
          "Check online for nice tv's",
          "Make a list of the best 3",
          "Buy the product, and check date of delivery"
        ]
      },
      {
        name: "Get a professional camera",
        description: "Start a new hobby",
        category: "Hobbys",
        task: [
          "Check online blogs to get some tips",
          "Save 1 month of salary",
          "Buy it before my next birthday"
        ]
      },
      {
        name: "Learn Node.js",
        description: "Increase my developer skills",
        category: "Education",
        task: [
          "Look up for some nice website",
          "Make a weekly study plan",
          "Start the course"
        ]
      },
      {
        name: "Increase my run pace",
        description: "Be able to run the next Berlin marathon",
        category: "Sport",
        task: [
          "Hire a running coach",
          "Start a diet to keep weight",
          "Get tips from friends that have done it before"
        ]
      },
    ]
  }
]

# generate users with tasks and goals
puts "Creating users..."
users.each do |user_input|
  file = File.open("app/assets/images/#{user_input[:image]}")
  user = User.new(email: user_input[:email], password: "123456", user_name: user_input[:user_name])
  user.photo.attach(io: file, filename: user_input[:image], content_type: "image/png")
  user.save
  puts "Created #{user.user_name}"

  puts "Creating goals..."
  user_input[:goals].each do |goal_input|
    goal = Goal.create!(name: goal_input[:name], description: goal_input[:description], category: goal_input[:category],
                        status: "In Progress", user: user, start_date: Date.today,
                        end_date: Faker::Date.between(from: '2022-09-23', to: '2023-02-25'))
    puts "Created #{goal.name}"

    puts "Creating tasks..."
    goal_input[:task].each do |task_input|
      Task.create!(name: task_input, status: "In Progress", goal_id: goal.id)
      puts "Created #{task.name}"
    end
  end
end

puts "Finished!"
