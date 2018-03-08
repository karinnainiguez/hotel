require_relative 'spec_helper'

describe "Reservation Class" do

  describe "#initialize" do

    it "can be created" do
      data = {room: Hotel::Room.new(number:5), start_date: "11/24/2018", end_date: "12/01/2018"}
      result = Hotel::Reservation.new(data)
      result.must_be_kind_of Hotel::Reservation
    end

    it "has start date and end date" do
      data = {room: Hotel::Room.new(number: 9), start_date: "11/24/2018", end_date: "12/01/2018"}
      reservation = Hotel::Reservation.new(data)
      reservation.start_date.must_be_kind_of Date
      reservation.end_date.must_be_kind_of Date
    end

    it "raises an error if end date is before start date" do
      data = {room: Hotel::Room.new(number: 14), start_date: "11/24/2018", end_date: "11/01/2018"}
      proc {
        Hotel::Reservation.new(data)
      }.must_raise ArgumentError
    end

    it "raises an error if incorrect date format is provided" do
      data = {room: Hotel::Room.new(number: 17), start_date: "Nov. 17", end_date: "Dec 1st"}
      proc {
        Hotel::Reservation.new(data)
      }.must_raise ArgumentError
    end

    it "required room is room instance" do
      data = {room: Hotel::Room.new(number: 8), start_date: "11/24/2018", end_date: "12/01/2018"}
      reservation = Hotel::Reservation.new(data)
      reservation.must_respond_to :room
      reservation.room.must_be_kind_of Hotel::Room
      reservation.room.number.must_equal 8
    end

    it "raises error if room entered is not instance of room" do
      data = {room: 18, start_date: "11/24/2018", end_date: "12/01/2018"}
      proc {
        Hotel::Reservation.new(data)
      }.must_raise ArgumentError

      data = {room: "Something else", start_date: "11/24/2018", end_date: "12/01/2018"}
      proc {
        Hotel::Reservation.new(data)
      }.must_raise ArgumentError
    end

    it "raises error if no room argument given" do
      data = {start_date: "11/24/2018", end_date: "12/01/2018"}
      proc {
        Hotel::Reservation.new(data)
      }.must_raise ArgumentError
    end


    it "raises error if no available rooms on that date" do
      # data = {start_date: "11/24/2018", end_date: "12/01/2018"}
      # reservation = Hotel::Reservation.new(data)
      # reservation.room.must_be_kind_of Hotel::Room
    end




    it "raises error if specified room is unavailable" do
      # data = {room: 25, start_date: "11/24/2018", end_date: "12/01/2018"}
      # proc {
      #   Hotel::Reservation.new(data)
      # }.must_raise ArgumentError

    end

  end # initialize

  describe "#stay_length helper method" do

    it "returns acurate days in integer form for one day reservation" do
      room = Hotel::Room.new(number: 4)
      reservation = Hotel::Reservation.new(room: room, start_date: "07/15/2018", end_date: "07/16/2018")
      expected_price = 1
      result = reservation.stay_length
      result.must_equal expected_price
    end

    it "returns zero if checkin and checkout are same day" do
      room = Hotel::Room.new(number: 4)
      reservation = Hotel::Reservation.new(room: room, start_date: "07/15/2018", end_date: "07/15/2018")
      expected_price = 0
      result = reservation.stay_length
      result.must_equal expected_price
    end

  end # stay_length

  describe "#total_cost" do

    it "returns an accurate total cost for 1 day stay" do
      expected_price = 100
      room = Hotel::Room.new(number: 5, price: expected_price)
      reservation = Hotel::Reservation.new(room: room, start_date: "05/01/2018", end_date: "05/02/2018")
      result = reservation.total_cost
      result.must_equal expected_price
    end

    it "returns an accurate total cost for 3 day stay" do
      room = Hotel::Room.new(number: 5, price: 100)
      reservation = Hotel::Reservation.new(room: room, start_date: "05/01/2018", end_date: "05/04/2018")
      expected_price = room.price * 3
      result = reservation.total_cost
      result.must_equal expected_price
    end

    it "returns zero if checkout is same day" do
      room = Hotel::Room.new(number: 5, price: 300)
      reservation = Hotel::Reservation.new(room: room, start_date: "05/01/2018", end_date: "05/01/2018")
      expected_price = 0
      result = reservation.total_cost
      result.must_equal expected_price
    end


  end # total_cost

end # Reservation Class
