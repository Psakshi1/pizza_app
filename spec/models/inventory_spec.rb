require "rails_helper"

RSpec.describe Inventory, type: :model do
  let(:inventory) { Inventory.new }

  describe "#add_item" do
    it "adds the correct quantity of an item" do
      inventory.add_item("Tomato", 5)
      expect(inventory.items["Tomato"]).to eq(5)
    end

    it "increments the quantity of an item if added again" do
      inventory.add_item("Tomato", 5)
      inventory.add_item("Tomato", 3)
      expect(inventory.items["Tomato"]).to eq(8)
    end
  end

  describe "#reduce_item" do
    it "reduces the quantity of an item correctly" do
      inventory.add_item("Tomato", 10)
      inventory.reduce_item("Tomato", 4)
      expect(inventory.items["Tomato"]).to eq(6)
    end

    it "raises an error if trying to reduce more than available" do
      inventory.add_item("Tomato", 5)
      expect { inventory.reduce_item("Tomato", 6) }.to raise_error("Tomato is out of stock")
    end
  end

  describe "#available?" do
    it "returns true if the item has enough quantity" do
      inventory.add_item("Tomato", 5)
      expect(inventory.available?("Tomato", 3)).to be(true)
    end

    it "returns false if the item does not have enough quantity" do
      inventory.add_item("Tomato", 3)
      expect(inventory.available?("Tomato", 5)).to be(false)
    end
  end
end
