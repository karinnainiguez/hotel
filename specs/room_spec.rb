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
        Hotel::Room.new(data)
      }.must_raise ArgumentError
      data = {number: 4.56, price: 400}
      proc{
        Hotel::Room.new(data)
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

  describe "#reserve" do
    before do
      @room = Hotel::Room.new(number:5)
    end

    it "adds each day of stay into reserved array" do
      @room.reserved.length.must_equal 0
      start_date = Date.new(2018, 05, 03)
      end_date = Date.new(2018, 05, 13)
      days_in_stay = end_date - start_date
      @room.reserve(start_date, end_date)
      @room.reserved.length.must_equal days_in_stay
    end

  end # reserve

  describe "#reserved?" do

    before do
      start_date = Date.new(2018, 04, 12)
      end_date = Date.new(2018, 04, 15)
      @room = Hotel::Room.new(number: 12)
      @room.reserve(start_date, end_date)
    end

    it "returns true if room is reserved on that day" do
      result = @room.reserved?(Date.new(2018, 04, 13))
      result.must_equal true
    end

    it "returns false if room is not reserved on that day" do
      result = @room.reserved?(Date.new(2018, 04, 17))
      result.must_equal false
    end

    it "returns false for checkout day" do
      result = @room.reserved?(Date.new(2018, 04, 15))
      result.must_equal false
    end

  end # reserved?

  describe "#block" do


  end # block

  describe "#blocked?" do

  end # blocked?


end # Room Class
