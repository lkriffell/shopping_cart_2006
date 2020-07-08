class Product

  attr_reader :category, :name, :unit_price, :quantity, :hoarded
  def initialize(category, name, unit_price, quantity)
    @category = category
    @name = name
    @unit_price = unit_price
    @quantity = quantity.to_i
    @hoarded = false
  end

  def total_price
    tot = quantity * unit_price
    tot.to_f
  end
# Couldn't figure these two methods out
  # def hoard
  #   hoarded = true
  # end
  #
  # def is_hoarded?
  #   false unless hoarded == true
  # end
end
