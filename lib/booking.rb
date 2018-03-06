

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


  end # Class Booking
end # Module Hotel
