require_relative 'spec_helper'

describe "Room Class" do

  describe "#initialize" do

    it "can be created" do
      data = {number: 4, price: 400}
      result = Hotel::Room.new(data)
      result.must_be_kind_of Hotel::Room
    end

    it "takes a room number" do
      data = {number: 4, price: 400}
      room = Hotel::Room.new(data)
      room.must_respond_to :number
    end

    it "has a room number that is an integer" do
      data = {number: 4}
      room = Hotel::Room.new(data)
      room.number.must_be_kind_of Integer
    end

    it "raises an argument if incorrect room number provided" do
      data = {number: "whatever", price: 400}
      proc{
        room = Hotel::Room.new(data)
      }.must_raise ArgumentError
      data = {number: 4.56, price: 400}
      proc{
        room = Hotel::Room.new(data)
      }.must_raise ArgumentError
    end

    it "has a price that is a float" do
      room = Hotel::Room.new({number: 5})
      room.must_respond_to :price
      room.price.must_be_kind_of Float
    end

    it "accepts an optional price" do
      price = 456.82
      room = Hotel::Room.new({number: 5, price: price})
      room.price.must_equal price
    end


  end # initialize


end # Room Class
