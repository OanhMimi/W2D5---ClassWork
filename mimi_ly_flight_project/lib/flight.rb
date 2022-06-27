# require_relative "passenger.rb"

class Flight
    attr_reader :passengers

    def initialize(flight_number,capacity)
        @flight_number = flight_number
        @capacity = capacity
        @passengers = []
    end

    def full?
        if @passengers.length == @capacity
            true
        else
            false
        end
    end

    def board_passenger(passenger) #a passenger object
        if passenger.has_flight?(@flight_number) && !self.full?
            @passengers << passenger
        end
    end

    def list_passengers
        @passengers.map do |each_passenger|
            each_passenger.name
        end
    end

    def [](index_number)
        @passengers[index_number]
    end

    def <<(passenger)
        self.board_passenger(passenger)
    end





    

end