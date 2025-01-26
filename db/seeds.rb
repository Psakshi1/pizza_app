MENU = {
  pizzas: [
    Pizza.new(name: "Deluxe Veggie", type: "vegetarian", sizes: { regular: 150, medium: 200, large: 325 }),
    Pizza.new(name: "Cheese and Corn", type: "vegetarian", sizes: { regular: 175, medium: 375, large: 475 }),
    Pizza.new(name: "Paneer Tikka", type: "vegetarian", sizes: { regular: 160, medium: 290, large: 340 }),
    Pizza.new(name: "Non-Veg Supreme", type: "non-vegetarian", sizes: { regular: 190, medium: 325, large: 425 }),
    Pizza.new(name: "Chicken Tikka", type: "non-vegetarian", sizes: { regular: 210, medium: 370, large: 500 }),
    Pizza.new(name: "Pepper Barbecue Chicken", type: "non-vegetarian", sizes: { regular: 220, medium: 380, large: 525 })
  ],
  crusts: [
    Crust.new("New hand tossed"),
    Crust.new("Wheat thin crust"),
    Crust.new("Cheese Burst"),
    Crust.new("Fresh pan pizza")
  ],
  toppings: [
    Topping.new(name: "Black olive", price: 20, type: "veg"),
    Topping.new(name: "Capsicum", price: 25, type: "veg"),
    Topping.new(name: "Paneer", price: 35, type: "veg"),
    Topping.new(name: "Chicken tikka", price: 35, type: "non-veg"),
    Topping.new(name: "Barbeque chicken", price: 45, type: "non-veg")
  ],
  sides: [
    Side.new(name: "Cold drink", price: 55),
    Side.new(name: "Mousse cake", price: 90)
  ]
}
