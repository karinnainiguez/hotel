


module  Hotel
  class Room

    attr_reader :number
    attr_accessor :price

    def initialize(data)
      if data[:number] == nil || data[:number].class != Integer || data[:number] < 1
        raise ArgumentError.new("Rooms must have a positive integer for room number. Received #{number}")
      end
      @number = data[:number]
      @price = data[:price].to_f ||= 200.00
    end



  end # Class Room
end # Module Hotel
