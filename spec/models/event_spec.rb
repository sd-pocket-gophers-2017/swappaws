require 'rails_helper'

RSpec.describe Event, :type => :model do
  let(:event) { Event.new }

  describe "#future_date" do
    it "returns event start time can't be in the past, if the start time is now" do
      event.start_date_time = DateTime.now
      expect(event.future_date).to eq(["can't be in the past"])
    end

    it "returns event start time can't be in the past, if the start time is in past" do
      event.start_date_time = DateTime.new(2001,2,3,4,5,6)
      expect(event.future_date).to eq(["can't be in the past"])
    end

    it "returns true" do
      event.start_date_time = DateTime.tomorrow
      expect(event.future_date).to eq(nil)
    end
  end
end
