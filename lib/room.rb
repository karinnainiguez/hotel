
require 'date'

module  Hotel
  class Room

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
      if @reserved.include?(date)
        return true
      else
        return false
      end
    end

    def reserve(start_date, end_date)
      stay = end_date - start_date

      stay.to_i.times do |index|
        @reserved << start_date + index
      end
    end

    def blocked?(date)

    end

    def block(date, name)

    end

    def validate_date(entry)
      if entry.class == String
        entry = Date.strptime(entry, '%m/%d/%Y')
        if entry.class != Date || entry < OLDEST_RES_DATE || entry > NEWEST_RES_DATE
          raise ArgumentError.new("Invalid date.  Please enter MM/DD/YYYY Received #{entry}")
        end
      elsif entry.class == Date
        if entry < OLDEST_RES_DATE || entry > NEWEST_RES_DATE
          raise ArgumentError.new("Date: Invalid date. Received #{entry}")
        end
      else
        raise ArgumentError.new("Other: Invalid date. Received #{entry}")
      end
      return entry
    end

    def validate_stay(beginning, ending)
      if beginning > ending
        raise ArgumentError.new("Start date cannot be after end date")
      end
    end



  end # Class Room
end # Module Hotel
