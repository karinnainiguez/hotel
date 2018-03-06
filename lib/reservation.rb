
require_relative 'loader'
require_relative 'room'

module  Hotel
  class Reservation < Loader

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



  end # Class Reservation
end # Module Hotel
