
require_relative 'room'

module  Hotel
  class Reservation

    OLDEST_RES_DATE = Date.new(1900, 01, 01)
    NEWEST_RES_DATE = Date.new(3999, 12, 31)

    attr_reader :start_date, :end_date, :room

    def initialize(data)
      # MUST BE INSTANCE OF ROOM
      if data[:room].class != Room
        raise ArgumentError.new("Must enter room to be reserved")
      end
      @room = data[:room]

      @start_date = validate_date(data[:start_date])
      @end_date = validate_date(data[:end_date])

      validate_stay(@start_date, @end_date)

      # OPTIONAL
      @block = data[:block]
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



  end # Class Reservation
end # Module Hotel
