require_relative 'spec_helper'

describe "Room Class" do

  describe "#initialize" do

    it "can be created" do
      result = Hotel::Room.new(4)
      result.must_be_kind_of Hotel::Room
    end

    it "takes a room number" do
      room = Hotel::Room.new(4)
      room.must_respond_to :number
    end

    it "has a room number that is an integer" do
      room = Hotel::Room.new(4)
      room.number.must_be_kind_of Integer
    end

    it "raises an argument if incorrect room number provided" do
      proc{
        room = Hotel::Room.new("whatever")
      }.must_raise ArgumentError
      proc{
        room = Hotel::Room.new(4.5)
      }.must_raise ArgumentError
    end






  end # initialize


end # Room Class
