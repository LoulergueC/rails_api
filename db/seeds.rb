# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "faker"

5.times do |i|
  User.create!(email: "user" + i.to_s + "@user.fr", password: "password")
end
30.times do
  Article.create!(title: Faker::Lorem.sentence, content: Faker::Lorem.paragraph, user: User.all.sample, private: [true, false].sample)
end
Article.all.each do |article|
  article.comments.create!(title: Faker::Lorem.sentence, content: Faker::Lorem.paragraph, user: User.all.sample)
end