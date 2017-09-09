
require 'faker'

User.destroy_all
Event.destroy_all
Participant.destroy_all
Pet.destroy_all

15.times do
  User.create!(email: Faker::Internet.email, password: "password", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
end

15.times do
  Event.create!(start_date_time: Faker::Time.forward(2, :morning), end_date_time: Faker::Time.forward(6, :evening), location: Faker::Address.street_address, user_id: User.all.pluck(:id).sample)
end

15.times do
  Participant.create!(role_id: [1,2].sample, event_id: Event.all.pluck(:id).sample, user_id: User.all.pluck(:id).sample)
end

15.times do
  Pet.create!(name: Faker::Hobbit.character, age: rand(1..10), breed: Faker::Cat.breed, description: Faker::MostInterestingManInTheWorld.quote, size: ["Small", "Medium", "Large"].sample, photos: Faker::Overwatch.quote, user_id: User.all.pluck(:id).sample)
end
