
require_relative 'loader'
require 'date'

module  Hotel
  class Room < Loader

    attr_reader :number, :reserved, :blocked
    attr_accessor :price

    def initialize(data)
      if data[:number] == nil || data[:number].class != Integer || data[:number] < 1
        raise ArgumentError.new("Rooms must have a positive integer for room number. Received #{number}")
      end
      @number = data[:number]
      @price = data[:price].to_f ||= 200.00
      @reserved = []
      @blocked = {}
    end

    def reserved?(date)
      date = validate_date(date)
      if @reserved.include?(date)
        return true
      else
        return false
      end
    end

    def reserve(start_date, end_date)
      start_date = validate_date(start_date)
      end_date = validate_date(end_date)
      validate_stay(start_date, end_date)
      stay = end_date - start_date

      stay.to_i.times do |index|
        @reserved << start_date + index
      end
    end

    def blocked?(date)

    end

    def block(date, name)

    end


  end # Class Room
end # Module Hotel
