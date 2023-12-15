# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

10.times do
  User.create!(name: Faker::Name.name, photo:'https://unsplash.com/photos/F_-0BxGuVvo', bio: Faker::Lorem.sentence, posts_counter: 0)
end

30.times do
  Post.create(user_id: Faker::Number.between(from: 1, to: 10), title: Faker::Lorem.word, text: Faker::Lorem.paragraph_by_chars, comments_counter: 0, likes_counter: 0)
end

100.times do
  Comment.create(post_id: Faker::Number.between(from: 1, to: 30), user_id: Faker::Number.between(from: 1, to: 10),text:Faker::Lorem.sentence)
end

150.times do
  Like.create(post_id: Faker::Number.between(from: 1, to: 30), user_id: Faker::Number.between(from: 1, to: 10))
end