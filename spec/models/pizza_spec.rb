require 'rails_helper'
RSpec.describe Pizza, type: :model do
  describe 'Pizza Model' do
    let(:pizza) do
      Pizza.new(
        name: "Deluxe Veggie",
        type: "Vegetarian",
        sizes: { regular: 150, medium: 200, large: 325 }
      )
    end

    it 'initializes with correct attributes' do
      expect(pizza.name).to eq("Deluxe Veggie")
      expect(pizza.type).to eq("Vegetarian")
      expect(pizza.sizes).to eq({ regular: 150, medium: 200, large: 325 })
    end

    it 'returns the correct price for a given size' do
      expect(pizza.price(:regular)).to eq(150)
      expect(pizza.price(:medium)).to eq(200)
      expect(pizza.price(:large)).to eq(325)
    end

    it 'returns nil for an invalid size' do
      expect(pizza.price(:extra_large)).to be_nil
    end

    it 'ensures type is either vegetarian or non-vegetarian' do
      expect(%w[Vegetarian Non-Vegetarian]).to include(pizza.type)
    end
  end
end
