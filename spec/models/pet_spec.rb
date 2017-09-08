require 'rails_helper'

RSpec.describe Pet, type: :model do
  user = User.create!(first_name: "Blake", last_name: "Meyer", email: Faker::Internet.email, password: "password")
  pet = Pet.create!(user_id: 1, name: "fido", age: 7, breed: "doge", size: "small", description: "So dog. very woof. wow.", photos: "http://i0.kym-cdn.com/entries/icons/original/000/013/564/doge.jpg")

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

    it "has a readable photo" do
      expect(pet.photos).to eq("http://i0.kym-cdn.com/entries/icons/original/000/013/564/doge.jpg")
    end
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
        pet.photos = nil
        expect(pet).to_not be_valid
      end
    end
  end

end
