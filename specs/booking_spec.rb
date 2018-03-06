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

  describe "#room_by_num" do

    before do
      @booking = Hotel::Booking.new
    end

    it "returns an instance of room" do
      result = @booking.room_by_num(12)
      result.must_be_kind_of Hotel::Room
    end

    it "returns nil if room does not exist" do
      result = @booking.room_by_num(67)
      result.must_be_nil
    end

    it "returns nil if invalid argument given" do
      result = @booking.room_by_num("Some String")
      result.must_be_nil
    end

  end # room_by_num

end # Booking Class
