class Stock
    def initialize(quantity)
        @quantity = quantity
    end

    def decrment
        @quantity -= 1
    end

    def empty?
        @quantity == 0
    end
end