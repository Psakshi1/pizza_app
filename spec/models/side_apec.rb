require "rails_helper"

RSpec.describe Side, type: :model do
  describe "#initialize" do
    it "initializes with the correct name and price" do
      side = Side.new(name: "Cold drink", price: 55)
      expect(side.name).to eq("Cold drink")
      expect(side.price).to eq(55)
    end
  end

  describe "#name" do
    it "returns the correct name" do
      side = Side.new(name: "Mousse cake", price: 90)
      expect(side.name).to eq("Mousse cake")
    end
  end

  describe "#price" do
    it "returns the correct price" do
      side = Side.new(name: "Cold drink", price: 55)
      expect(side.price).to eq(55)
    end
  end

  describe "#name=" do
    it "sets the name correctly" do
      side = Side.new(name: "Cold drink", price: 55)
      side.name = "Pizza"
      expect(side.name).to eq("Pizza")
    end
  end

  describe "#price=" do
    it "sets the price correctly" do
      side = Side.new(name: "Cold drink", price: 55)
      side.price = 60
      expect(side.price).to eq(60)
    end
  end
end
