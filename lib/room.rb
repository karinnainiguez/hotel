


module  Hotel
  class Room

    attr_reader :number

    def initialize(number)
      if number.class != Integer || number < 1
        raise ArgumentError.new("Rooms must have a positive integer for room number. Received #{number}")
      end
      @number = number



    end



  end # Class Room
end # Module Hotel
