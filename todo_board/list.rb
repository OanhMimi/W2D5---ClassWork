require_relative "item.rb"
class List

    attr_accessor :label
    def initialize(label)
        @label = label
        @items = Array.new
    end

    def add_item(title,deadline,description=nil)
        description ||= (description = "")
        if Item.valid_date?(deadline)
            new_item = Item.new(title,deadline,description)
            @items << new_item
            true  
        else
            false
        end  
    end

    def size
        @items.length
    end

    def valid_index?(index)
        if @items[index].nil?
            false
        else
            true
        end
    end

    def swap(index_1,index_2)
        if self.valid_index?(index_1) && self.valid_index?(index_2)
            @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
            true
        else
            false
        end
    end

    def [](index)
        if self.valid_index?(index)
            return @items[index]
        else
            nil
        end
    end

    def priority
        @items[0]
    end

    def print
        puts "------------------------------------------"
        puts "               #{self.label}               "
        puts "------------------------------------------"
        puts "Index  |                    | Deadline   "
        puts "------------------------------------------"
        @items.each_with_index do |item,i|
            puts " #{i}     | #{item.title} #{item.deadline}"
        end
        puts "------------------------------------------"
    end

    def print_full_item(index)
        if self.[](index)
            puts "-------------------------------------------"
            puts " #{@items[index].title}                #{@items[index].deadline}"
            puts" #{@items[index].description} "
            puts "-------------------------------------------"
        end
    end

    def print_priority
        @items[0]
    end

    def up(index,amount=nil)
        amount ||= (amount == 1)
        index_1 = @items[index]
        index_2 = @items[index+1]
        if self.valid_index?(index)
            return false
        else
            amount.times do
                self.swap(index_1,index_2) until index_1 == 0
            end
        end
        return true
    end
  
end