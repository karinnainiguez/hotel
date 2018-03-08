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

  describe "#reserve" do

    it "returns a reservation with start date and end date." do
      book = Hotel::Booking.new
      start = Date.new(2018, 04, 02)

      result = book.reserve(start_date: start, end_date: start + 3)
      result.must_be_kind_of Hotel::Reservation
    end

    it "updates the reservations array" do
      book = Hotel::Booking.new
      before = book.reservations.length
      book.reserve(start_date: "05/02/2018", end_date: "05/08/2018")
      after = book.reservations.length
      after.must_equal before + 1
      book.reservations[0].must_be_kind_of Hotel::Reservation
    end

    it "raises an error if no available rooms" do
      book = Hotel::Booking.new
      20.times do
        book.reserve(start_date: "06/01/2018", end_date: "06/03/2018")
      end
      proc {
        book.reserve(start_date: "06/01/2018", end_date: "06/03/2018")
      }.must_raise ArgumentError
    end

    it "raises an error if incorrect date information is given" do
      book = Hotel::Booking.new
      proc {
        book.reserve(start_date: "August 29th", end_date: "09/30/2018")
      }.must_raise ArgumentError
    end

    it "raises an error if no start date or end date is given" do
      book = Hotel::Booking.new
      proc {
        book.reserve(end_date: "09/30/2018")
      }.must_raise ArgumentError

      proc {
        book.reserve(start_date: "09/30/2018")
      }.must_raise ArgumentError

      proc {
        book.reserve()
      }.must_raise ArgumentError
    end

    it "raises an error if end date is before start date" do
      book = Hotel::Booking.new
      proc {
        book.reserve(start_date: "11/01/2018", end_date: "09/30/2018")
      }.must_raise ArgumentError
    end


  end # reserve

end # Booking Class
