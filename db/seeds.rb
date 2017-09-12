
require 'faker'

User.destroy_all
Event.destroy_all
Pet.destroy_all
Review.destroy_all

15.times do
  User.create!(email: Faker::Internet.email, password: "password", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
end

15.times do
  Event.create!(sitter: User.all.sample, owner_id: nil, start_date_time: Faker::Time.forward(2, :morning), end_date_time: Faker::Time.forward(6, :evening), location: Faker::Address.street_address)
end

15.times do
  Pet.create!(name: Faker::Hobbit.character, age: rand(1..10), breed: Faker::Cat.breed, description: Faker::MostInterestingManInTheWorld.quote, size: ["s", "m", "l"].sample, photos: Faker::Overwatch.quote, user_id: User.all.pluck(:id).sample)
end

15.times do
  Event.create!(sitter: User.all.sample, owner: User.all.sample, start_date_time: Faker::Time.backward(2, :morning), end_date_time: Faker::Time.backward(6, :evening), location: Faker::Address.street_address)
end

15.times do
  Review.create!(event: Event.where('end_date_time < ?', DateTime.now).sample, body: Faker::ChuckNorris.fact, type_reviews: ['owner', 'sitter'].sample )
end
