require_relative 'spec_helper'

describe "Reservation Class" do

  describe "#initialize" do

    it "can be created" do
      data = {start_date: "11/24/2018", end_date: "12/01/2018"}
      result = Hotel::Reservation.new(data)
      result.must_be_kind_of Hotel::Reservation
    end

    it "has start date and end date" do
      data = {start_date: "11/24/2018", end_date: "12/01/2018"}
      reservation = Hotel::Reservation.new(data)
      reservation.start_date.must_be_kind_of Date
      reservation.end_date.must_be_kind_of Date
    end

    it "raises an error if end date is before start date" do
      data = {start_date: "11/24/2018", end_date: "11/01/2018"}
      proc {
        Hotel::Reservation.new(data)
      }.must_raise ArgumentError
    end

    it "raises an error if incorrect date format is provided" do
      data = {start_date: "Nov. 17", end_date: "Dec 1st"}
      proc {
        Hotel::Reservation.new(data)
      }.must_raise ArgumentError
    end

    it "has a room instance" do
      data = {start_date: "11/24/2018", end_date: "12/01/2018"}
      reservation = Hotel::Reservation.new(data)
      reservation.must_respond_to :room
    end


    it "raises error if no available rooms on that date" do
      # data = {start_date: "11/24/2018", end_date: "12/01/2018"}
      # reservation = Hotel::Reservation.new(data)
      # reservation.room.must_be_kind_of Hotel::Room
    end


    it "accepts optional room number argument" do
      data = {room: 8, start_date: "11/24/2018", end_date: "12/01/2018"}
      reservation = Hotel::Reservation.new(data)
      reservation.room.must_equal 8
    end

    it "raises error if specified room is unavailable" do
      # data = {room: 25, start_date: "11/24/2018", end_date: "12/01/2018"}
      # proc {
      #   Hotel::Reservation.new(data)
      # }.must_raise ArgumentError

    end








  end # initialize


end # Reservation Class
