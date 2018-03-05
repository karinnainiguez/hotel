require_relative 'spec_helper'

describe "Booking Class" do

  describe "#initialize" do

    it "can be created" do
      result = Hotel::Booking.new
      result.must_be_kind_of Hotel::Booking
    end

    it "has a rooms array" do
      booking = Hotel::Booking.new
      booking.rooms.must_be_kind_of Array
    end

    it "has collection of 20 rooms" do
      booking = Hotel::Booking.new
      booking.rooms.length.must_equal 20
      booking.rooms.each do |room|
        room.must_be_kind_of Hotel::Room
      end
    end

  end # initialize

end # Booking Class
