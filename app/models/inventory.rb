class Inventory
  attr_accessor :items

  def initialize
    @items = Hash.new(0) # Tracks inventory for ingredients
  end

  def add_item(item, quantity)
    @items[item] += quantity
  end

  def reduce_item(item, quantity)
    raise "#{item} is out of stock" if @items[item] < quantity

    @items[item] -= quantity
  end

  def available?(item, quantity)
    @items[item] >= quantity
  end
end
