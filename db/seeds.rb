
require 'faker'

User.destroy_all
Event.destroy_all
Participant.destroy_all

15.times do
  User.create!(email: Faker::Internet.email, password: "password", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
end

15.times do
  Event.create!(start_date_time: Faker::Time.forward(2, :morning), end_date_time: Faker::Time.forward(6, :evening), location: Faker::Address.street_address, user_id: rand(1..15))
end

15.times do
  Participant.create!(role_id: [1,2].sample, event_id: rand(1..15), user_id: rand(1..15))
end
