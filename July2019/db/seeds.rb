# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Question.destroy_all

NUM_QUESTIONS = 200

NUM_QUESTIONS.times do
  created_at = Faker::Date.backward(days: 365 * 5)
  Question.create(
    title: Faker::Hacker.say_something_smart,
    body: Faker::ChuckNorris.fact,
    view_count: rand(100_000),
    created_at: created_at,
    updated_at: created_at
  )
end

questions = Question.all

puts Cowsay.say("Generated #{questions.count} questions", :frogs)
