require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:veg_topping) { double("Topping", name: "Capsicum", type: "veg", price: 25) }
  let(:non_veg_topping) { double("Topping", name: "Chicken Tikka", type: "non-veg", price: 35) }
  let(:paneer_topping) { double("Topping", name: "Paneer", type: "veg", price: 35) }
  let(:pizza) { { name: "Deluxe Veggie", type: "vegetarian", price: 150, toppings: [] } }
  let(:non_veg_pizza) { { name: "Non-Veg Supreme", type: "non-vegetarian", price: 190, toppings: [] } }
  let(:side) { double("Side", name: "Cold Drink", price: 55) }

  describe "#add_pizza" do
    it "adds a pizza to the order" do
      order = Order.new
      order.add_pizza(pizza)

      expect(order.pizzas).to include(pizza)
      expect(order.total_price).to eq(150)
    end
  end

  describe "#add_side" do
    it "adds a side to the order" do
      order = Order.new
      order.add_side(side)

      expect(order.sides).to include(side)
      expect(order.total_price).to eq(55)
    end
  end

  describe "#verify_order" do
    it "raises an error if vegetarian pizza has non-vegetarian toppings" do
      pizza[:toppings] << non_veg_topping
      order = Order.new
      order.add_pizza(pizza)

      expect { order.verify_order }.to raise_error("Vegetarian pizza cannot have non-vegetarian toppings!")
    end

    it "raises an error if non-vegetarian pizza has paneer topping" do
      non_veg_pizza[:toppings] << paneer_topping
      order = Order.new
      order.add_pizza(non_veg_pizza)

      expect { order.verify_order }.to raise_error("Non-vegetarian pizza cannot have paneer topping!")
    end

    it "does not raise an error for valid vegetarian pizza toppings" do
      pizza[:toppings] << veg_topping
      order = Order.new
      order.add_pizza(pizza)

      expect { order.verify_order }.not_to raise_error
    end

    it "does not raise an error for valid non-vegetarian pizza toppings" do
      non_veg_pizza[:toppings] << non_veg_topping
      order = Order.new
      order.add_pizza(non_veg_pizza)

      expect { order.verify_order }.not_to raise_error
    end
  end

  describe "#finalize_order" do
    it "verifies and finalizes the order" do
      pizza[:toppings] << veg_topping
      order = Order.new
      order.add_pizza(pizza)
      order.add_side(side)
      expect { order.finalize_order }.to output(/Order placed successfully! Total amount: Rs. 230/).to_stdout
    end

    it "raises an error if the order has invalid pizzas" do
      pizza[:toppings] << non_veg_topping
      order = Order.new
      order.add_pizza(pizza)

      expect { order.finalize_order }.to raise_error("Vegetarian pizza cannot have non-vegetarian toppings!")
    end
  end
end
