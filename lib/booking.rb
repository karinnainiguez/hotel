
require_relative 'loader'
require_relative 'reservation'
require_relative 'room'



module  Hotel
  class Booking < Loader

    NUM_OF_ROOMS = 20

    attr_reader :rooms, :reservations

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


    def rooms_by_day(date)
      date = validate_date(date)
      @rooms.reject do |room|
        room.reserved?(date) && room.blocked?(date)
      end
    end

    def rooms_by_range(start_date, end_date)
      start_date = validate_date(start_date)
      end_date = validate_date(end_date)
      date_set = Set.new(start_date...end_date)
      avail_array = @rooms.reject do |room|
        date_set.intersect? room.reserved.to_set
      end

      return avail_array
    end


    def reserve(data)
      start_date = validate_date(data[:start_date])
      end_date = validate_date(data[:end_date])
      available_rooms = rooms_by_range(start_date, end_date)
      if available_rooms.length == 0
        raise ArgumentError.new("Sorry, we do not have a room available at this time")

      else
        room = available_rooms.sample
      end


      reservation = Reservation.new(start_date: start_date, end_date: end_date, room: room)
      @reservations << reservation
      room.reserve(start_date, end_date)
      return reservation
    end


  end # Class Booking
end # Module Hotel
