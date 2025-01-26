require "rails_helper"

RSpec.describe Crust, type: :model do
  describe "#initialize" do
    it "initializes with the correct name" do
      crust = Crust.new("Cheese Burst")
      expect(crust.name).to eq("Cheese Burst")
    end
  end

  describe "#name" do
    it "returns the correct name" do
      crust = Crust.new("Hand Tossed")
      expect(crust.name).to eq("Hand Tossed")
    end
  end

  describe "#name=" do
    it "sets the name correctly" do
      crust = Crust.new("Thin Crust")
      crust.name = "Wheat Thin Crust"
      expect(crust.name).to eq("Wheat Thin Crust")
    end
  end
end
