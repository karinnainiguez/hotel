require_relative 'spec_helper'

describe "Booking Class" do
  describe "#initialize" do
    it "can be created" do
      result = Hotel::Booking.new
      result.must_be_kind_of Hotel::Booking
    end
  end # initialize


end # Booking Class
