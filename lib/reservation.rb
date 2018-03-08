
require_relative 'loader'
require_relative 'room'

module  Hotel
  class Reservation < Loader

    attr_reader :start_date, :end_date, :room

    def initialize(data)
      if data[:room].class != Room
        raise ArgumentError.new("Must enter room to be reserved")
      end
      @room = data[:room]

      @start_date = validate_date(data[:start_date])
      @end_date = validate_date(data[:end_date])
      validate_stay(@start_date, @end_date)

      # OPTIONAL
      @block = data[:block] # NIL if not provided
    end

    def total_cost

    end

    def stay_length
    end

  end # Class Reservation
end # Module Hotel
