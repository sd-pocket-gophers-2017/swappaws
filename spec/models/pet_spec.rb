require 'rails_helper'

RSpec.describe Pet, type: :model do
  user = User.create!(email: Faker::Internet.email, password: "password", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, street_address:Faker::Address.street_address, city:Faker::Address.city, state: Faker::Address.state, longitude: Faker::Address.longitude, latitude: Faker::Address.latitude)
  pet = Pet.create!(name: "fido", age: 7, breed: "doge", description: "So dog. very woof. wow.", size: "small",  user_id: User.all.pluck(:id).sample, photo: "http://i0.kym-cdn.com/entries/icons/original/000/013/564/doge.jpg")

  describe "pet creation" do
    it "has a readable name" do
      expect(pet.name).to eq("fido")
    end

    it "has a readable age" do
      expect(pet.age).to eq(7)
    end

    it "has a readable breed" do
      expect(pet.breed).to eq("doge")
    end

    it "has a readable size" do
      expect(pet.size).to eq("small")
    end

    it "has a readable description" do
      expect(pet.description).to eq("So dog. very woof. wow.")
    end

    # it "has a readable photo" do
    #   expect(pet.photo).to eq("http://i0.kym-cdn.com/entries/icons/original/000/013/564/doge.jpg")
    # end
  end

  describe "validation" do
    context "when all fields are filled" do
      it "is valid" do
        expect(pet).to be_valid
      end
    end

    context "when its name is nil" do
      it "is not valid" do
        pet.name = nil
        expect(pet).to_not be_valid
      end
    end

    context "when its breed is nil" do
      it "is not valid" do
        pet.breed = nil
        expect(pet).to_not be_valid
      end
    end

    context "when its age is nil" do
      it "is not valid" do
        pet.age = nil
        expect(pet).to_not be_valid
      end
    end

    context "when its description is nil" do
      it "is not valid" do
        pet.description = nil
        expect(pet).to_not be_valid
      end
    end

    context "when its size is nil" do
      it "is not valid" do
        pet.size = nil
        expect(pet).to_not be_valid
      end
    end

    context "when its photos are nil" do
      it "is not valid" do
        pet.photo = nil
        expect(pet).to_not be_valid
      end
    end
  end

end
