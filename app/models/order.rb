class Order
  attr_accessor :pizzas, :sides, :total_price

  def initialize
    @pizzas = []
    @sides = []
    @total_price = 0
  end

  def add_pizza(pizza)
    pizzas << pizza
    @total_price += pizza[:price] + pizza[:toppings].sum { |t| t.price }
  end

  def add_side(side)
    sides << side
    @total_price += side.price
  end

  def verify_order
    pizzas.each do |pizza|
      if pizza[:type] == "vegetarian"
        raise "Vegetarian pizza cannot have non-vegetarian toppings!" if pizza[:toppings].any? { |t| t.type == "non-veg" }
      elsif pizza[:type] == "non-vegetarian"
        raise "Non-vegetarian pizza cannot have paneer topping!" if pizza[:toppings].any? { |t| t.name == "Paneer" }
      end
    end
  end

  def finalize_order
    verify_order
    puts "Order placed successfully! Total amount: Rs. #{@total_price}"
  end
end
