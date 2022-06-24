class Passenger

    attr_reader :name
    def initialize(name)
        @name = name
        @flight_numbers = []
    end

    def has_flight?(number)
        if @flight_numbers.include?(number.upcase)
            true
        else
            false
        end
    end

    def add_flight(number)
        if !has_flight?(number)
            @flight_numbers << number.upcase
        end
    end




end 