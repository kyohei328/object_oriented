require './drink'
require './storage'
require './coin_mech'

class VendingMachine

  def initialize
    @storage = Storage.new
    @coin_mech = CoinMech.new
  end

  def buy(payment, kind_of_drink)
    # 100円と500円だけ受け付ける
    if payment != Coin::ONE_HUNDRED && payment != Coin::FIVE_HUNDRED
      @coin_mech.add_coin_into_change(payment)
      return nil
    end
    # ドリンクの在庫がない時はお金を返す
    if @storage.empty?(kind_of_drink)
      @coin_mech.add_coin_into_change(payment)
      return nil
    end

    # 釣り銭不足
    if payment == Coin::FIVE_HUNDRED && @coin_mech.not_have_change?
      @coin_mech.add_coin_into_change(payment)
      return nil
    end

    if payment == Coin::ONE_HUNDRED
      @coin_mech.add_coin_into_cash_box(payment)
    elsif payment == Coin::FIVE_HUNDRED then
      # 400円のお釣り
      @coin_mech.add_change(@coin_mech.take_out_change)
    end

    @storage.decrment(kind_of_drink)

    Drink.new(kind_of_drink)
  end

  def refund
    @coin_mech.refund
  end

end

