class Pizza
  attr_accessor :name, :type, :sizes

  def initialize(name:, type:, sizes:)
    @name = name
    @type = type # vegetarian or non-vegetarian
    @sizes = sizes # { regular: price, medium: price, large: price }
  end

  def price(size)
    sizes[size]
  end
end
