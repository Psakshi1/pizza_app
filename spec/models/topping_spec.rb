require "rails_helper"

RSpec.describe Topping, type: :model do
  describe "#initialize" do
    it "initializes with the correct name, price, and type" do
      topping = Topping.new(name: "Black Olive", price: 20, type: "veg")
      expect(topping.name).to eq("Black Olive")
      expect(topping.price).to eq(20)
      expect(topping.type).to eq("veg")
    end
  end

  describe "#name" do
    it "returns the correct name" do
      topping = Topping.new(name: "Chicken Tikka", price: 35, type: "non-veg")
      expect(topping.name).to eq("Chicken Tikka")
    end
  end

  describe "#price" do
    it "returns the correct price" do
      topping = Topping.new(name: "Mushroom", price: 30, type: "veg")
      expect(topping.price).to eq(30)
    end
  end

  describe "#type" do
    it "returns the correct type" do
      topping = Topping.new(name: "Paneer", price: 35, type: "veg")
      expect(topping.type).to eq("veg")
    end
  end

  describe "#name=" do
    it "sets the name correctly" do
      topping = Topping.new(name: "Capsicum", price: 25, type: "veg")
      topping.name = "Fresh Tomato"
      expect(topping.name).to eq("Fresh Tomato")
    end
  end

  describe "#price=" do
    it "sets the price correctly" do
      topping = Topping.new(name: "Barbeque Chicken", price: 45, type: "non-veg")
      topping.price = 50
      expect(topping.price).to eq(50)
    end
  end

  describe "#type=" do
    it "sets the type correctly" do
      topping = Topping.new(name: "Grilled Chicken", price: 40, type: "non-veg")
      topping.type = "veg"
      expect(topping.type).to eq("veg")
    end
  end
end
