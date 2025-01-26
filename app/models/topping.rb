class Topping
  attr_accessor :name, :price, :type

  def initialize(name:, price:, type:)
    @name = name
    @price = price
    @type = type # veg or non-veg
  end
end
