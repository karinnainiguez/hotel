

require_relative 'reservation'
require_relative 'room'



module  Hotel
  class Booking

    NUM_OF_ROOMS = 20

    attr_reader :rooms

    def initialize
      @rooms = []
      @reservations = []
      create_rooms
    end # initialize

    def create_rooms
      NUM_OF_ROOMS.times do |i|
        data = {number: i+1}
        @rooms << Room.new(data)
      end
    end # create_rooms

    def room_by_num(num)
      @rooms.find do |room|
        room.number == num
      end
    end

    def find_next_room(start_date, end_date)

    end

    def available_rooms(date)

    end

    def reserve(data)
      start_date = data[:start_date]
      end_date = data[:end_date]
      if data[:room_num]
        room = room_by_num(data[:room_num])
      else
        room = find_next_room
      end
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


  end # Class Booking
end # Module Hotel
