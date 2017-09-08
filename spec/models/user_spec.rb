require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.create!(first_name: "Blake", last_name: "Meyer", email: Faker::Internet.email, password: "password")

  describe "user creation" do
    it "has a readable first name" do
      expect(user.first_name).to eq("Blake")
    end

    it "has a readable last name" do
      expect(user.last_name).to eq("Meyer")
    end

    it "encrypts the password on user creation" do
      expect(user.encrypted_password).to_not eq("password")
    end

    it "checks whether it is a valid password" do
      expect(user.password).to eq("password")
    end
  end

  describe "#valid?" do
    context "when all fields are filled" do
      it "is valid" do
        expect(user).to be_valid
      end
    end
    context "when its email is nil" do
      it "is not valid" do
        user.email = nil
        expect(user).to_not be_valid
      end
    end

    context "when password is nil" do
      it "it not valid" do
        user.password = nil
        expect(user).to_not be_valid
      end
    end
  end
end
