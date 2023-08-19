require './stock'

class Storage
    def initialize
        @stocks = {}
        @stocks[DrinkType::COKE] = Stock.new(5) # 在庫本数分newしている
        @stocks[DrinkType::DIET_COKE] = Stock.new(5)
        @stocks[DrinkType::TEA] = Stock.new(5)
    end

    def not_have_stock?(type)
        @stocks[type].empty?
    end

    def take_out(type)
        @stocks[type].decrment
        Drink.new(type)
    end
end
