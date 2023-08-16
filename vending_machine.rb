require './drink'
require './coin'
require './stock'
require './stock_of_100yen'
require './change'

class VendingMachine

  def initialize
    # @quantity_of_coke = 5 # コーラの在庫数
    # @quantity_of_diet_coke = 5 # ダイエットコーラの在庫数
    # @quantity_of_tea = 5 # お茶の在庫数
    # @number_of_100yen = 10 # 100円玉の在庫
    # @change = 0 # お釣り
    @stock_of_coke = Stock.new(5) # コーラの在庫数
    @stock_of_diet_coke = Stock.new(5) # ダイエットコーラの在庫数
    @stock_of_tea = Stock.new(5) # お茶の在庫数
    @stock_of_100yen = StockOf100yen.new(10) # 100円玉の在庫
    @change = Change.new # お釣り

  end

  def buy(payment, kind_of_drink)
    # 100円と500円だけ受け付ける
    # if payment != 100 && payment != 500
    if payment != Coin::ONE_HUNDRED && payment != Coin::FIVE_HUNDRED
      # @change += payment
      @change.add(payment)
      return nil
    end

    # if kind_of_drink == Drink::COKE && @quantity_of_coke == 0
    #   @change += payment
    #   return nil
    # elsif kind_of_drink == Drink::DIET_COKE && @quantity_of_diet_coke == 0 then
    #   @change += payment
    #   return nil
    # elsif kind_of_drink == Drink::TEA && @quantity_of_tea == 0 then
    #   @change += payment
    #   return nil
    # end
    if kind_of_drink == DrinkType::COKE && @stock_of_coke.empty?
      @change.add(payment)
      return nil
    elsif kind_of_drink == DrinkType::DIET_COKE && @stock_of_diet_coke.empty? then
      @change.add(payment)
      return nil
    elsif kind_of_drink == DrinkType::TEA && @stock_of_tea.empty? then
      @change.add(payment)
      return nil
    end

    # 釣り銭不足
    # if payment == 500 && @number_of_100yen < 4
    #   @change += payment
    #   return nil
    # end
    if payment == Coin::FIVE_HUNDRED && @stock_of_100yen.not_have_change?
      @change.add(payment)
      return nil
    end

    # if payment == 100
    #   @number_of_100yen += 1
    # elsif payment == 500 then
    if payment == Coin::ONE_HUNDRED
      @stock_of_100yen.add(payment)
    elsif payment == Coin::FIVE_HUNDRED then
      # 400円のお釣り
      # @change += (payment - 100)
      # # 100円玉を釣り銭に使える
      # @number_of_100yen -= (payment - 100) / 100
      @change.add_all(@stock_of_100yen.take_out_change)
    end

    # if kind_of_drink == Drink::COKE
    #   @quantity_of_coke -= 1
    # elsif kind_of_drink == Drink::DIET_COKE then
    #   @quantity_of_diet_coke -= 1
    # else
    #   @quantity_of_tea -= 1
    # end
    if kind_of_drink == DrinkType::COKE
      @stock_of_coke.decrment
    elsif kind_of_drink == DrinkType::DIET_COKE then
      @stock_of_diet_coke.decrment
    else
      @stock_of_tea.decrment
    end

    Drink.new(kind_of_drink)
  end

  # def refund
  #   result = @change
  #   @change = 0
  #   result
  # end
  def refund
    result = @change.clone
    @change.clear
    result
  end

end

