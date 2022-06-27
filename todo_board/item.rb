class Item

    attr_accessor :title, :description
    attr_reader :deadline
    def self.valid_date?(date_string)
        new_date = date_string.split("-")
        return false if new_date[0].length != 4
        return false if new_date[1].length != 2
        return false if new_date[2].length != 2
        return false if new_date.length != 3
        return false if !(1..12).include?(new_date[1].to_i)
        return false if !(1..31).include?(new_date[2].to_i)
        true
    end

    def deadline=(new_deadline)
        if Item.valid_date?(new_deadline)
            @deadline = new_deadline
        else
            raise "deadline is not valid"
        end
        
    end

    def initialize(title,deadline,description)
        @title = title
        @deadline = deadline
        @description = description
        if !Item.valid_date?(deadline)
            raise "deadline is not valid"
        end
    end


end

