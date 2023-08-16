class Drink
  # COKE = 0
  # DIET_COKE = 1
  # TEA = 2

  def initialize(kind)
    @kind = kind
  end

  def coke?
    @kind == DrinkType::COKE
  end

  def diet_coke?
    @kind == DrinkType::DIET_COKE
  end

  def tea?
    @kind == DrinkType::TEA
  end
end

