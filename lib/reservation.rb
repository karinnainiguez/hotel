
require_relative 'room'

module  Hotel
  class Reservation

    OLDEST_RES_DATE = Date.new(1900, 01, 01)
    NEWEST_RES_DATE = Date.new(3999, 12, 31)

    attr_reader :start_date, :end_date, :room

    def initialize(data)
      if data[:room].class != Room
        raise ArgumentError.new("Must enter room to be reserved")
      end
      @room = data[:room] # MUST BE INSTANCE OF ROOM


      @start_date = validate_date(data[:start_date])
      @end_date = validate_date(data[:end_date])

      if @start_date > @end_date
        raise ArgumentError.new("Start date cannot be after end date")
      end

      # OPTIONAL
      @block = data[:block]
    end

    def validate_date(string)
      date = Date.strptime(string, '%m/%d/%Y')
      if !date || date < OLDEST_RES_DATE || date > NEWEST_RES_DATE
        raise ArgumentError.new("Invalid date. Received #{string}")
      end
      return date
    end



  end # Class Reservation
end # Module Hotel
