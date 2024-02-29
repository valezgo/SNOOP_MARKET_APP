Item.destroy_all
Category.destroy_all
User.destroy_all

# Create the categories array

categories = [
  { name: "Fruits", description: "Fresh Fruits", color: "primary-red" },
  { name: "Vegetables", description: "Fresh Vegetables", color: "green" },
  { name: "Dairy", description: "Milk, Cheese, Yogurt", color: "yellow" },
  { name: "Meat", description: "Chicken, Beef, Pork", color: "secondary-red" },
  { name: "Bakery", description: "Bread, Pastries, Cakes", color: "purple" },
  { name: "Snacks", description: "Chips, Nuts, Crackers", color: "pink" },
  { name: "Beverages", description: "Sodas, Juices, Tea", color: "secondary-blue" },
  { name: "Condiments", description: "Sauces, Spices, Dressings", color: "orange" }
]

# Create the users array

users = [
  { email: "ciscotomaramo@gmail.com", password: "password" },
  { email: "msvalerialg@gmail.com", password: "password" },
  { email: "martin.guido.r17@gmail.com", password: "password" },
  { email: "ottatinicolas91@gmail.com", password: "password" },

]

# Create the items hash

items = {
  fruits: [
    { name: "Banana", description: "From Ecuador", quantity: 100, price: 0.59 },
    { name: "Orange", description: "Freshly picked", quantity: 80, price: 0.75 },
    { name: "Kiwi", description: "Imported from New Zealand", quantity: 40, price: 1.25 },
    { name: "Apple", description: "Local variety", quantity: 60, price: 0.95 },
    { name: "Grapes", description: "Seedless", quantity: 50, price: 2.50 },
    { name: "Pineapple", description: "Tropical delight", quantity: 30, price: 1.99 }
  ],
  vegetables: [
    { name: "Tomato", description: "Organically grown", quantity: 70, price: 0.89 },
    { name: "Spinach", description: "Locally sourced", quantity: 60, price: 1.15 },
    { name: "Carrot", description: "Freshly harvested", quantity: 50, price: 0.45 },
    { name: "Broccoli", description: "Nutritious", quantity: 40, price: 1.75 },
    { name: "Bell Pepper", description: "Assorted colors", quantity: 30, price: 1.20 },
    { name: "Cucumber", description: "Crunchy and refreshing", quantity: 40, price: 0.75 }
  ],
  dairy: [
    { name: "Milk", description: "Whole milk", quantity: 20, price: 2.50 },
    { name: "Cheese", description: "Cheddar", quantity: 15, price: 3.75 },
    { name: "Yogurt", description: "Greek yogurt", quantity: 25, price: 1.50 },
    { name: "Butter", description: "Salted butter", quantity: 10, price: 2.25 },
    { name: "Cream", description: "Heavy cream", quantity: 10, price: 3.00 },
    { name: "Eggs", description: "Free-range", quantity: 30, price: 2.99 }
  ],
  meat: [
    { name: "Chicken Breast", description: "Boneless", quantity: 30, price: 4.50 },
    { name: "Ground Beef", description: "Lean", quantity: 25, price: 5.75 },
    { name: "Pork Chops", description: "Center-cut", quantity: 20, price: 6.25 },
    { name: "Salmon Fillet", description: "Wild-caught", quantity: 15, price: 8.99 },
    { name: "Lamb Leg", description: "Australian", quantity: 10, price: 9.50 },
    { name: "Turkey Breast", description: "Sliced", quantity: 20, price: 7.25 }
  ],
  bakery: [
    { name: "Baguette", description: "French style", quantity: 40, price: 2.25 },
    { name: "Croissant", description: "Butter pastry", quantity: 35, price: 1.75 },
    { name: "Chocolate Cake", description: "Decadent", quantity: 20, price: 12.99 },
    { name: "Cinnamon Roll", description: "Freshly baked", quantity: 30, price: 2.99 },
    { name: "Sourdough Bread", description: "Artisanal", quantity: 25, price: 3.50 },
    { name: "Muffin", description: "Blueberry", quantity: 25, price: 1.99 }
  ],
  snacks: [
    { name: "Potato Chips", description: "Classic", quantity: 50, price: 1.99 },
    { name: "Mixed Nuts", description: "Salted", quantity: 40, price: 4.50 },
    { name: "Crackers", description: "Whole grain", quantity: 45, price: 2.75 },
    { name: "Popcorn", description: "Butter flavor", quantity: 55, price: 1.25 },
    { name: "Pretzels", description: "Twisted", quantity: 60, price: 3.00 },
    { name: "Trail Mix", description: "Healthy blend", quantity: 35, price: 3.25 }
  ],
  beverages: [
    { name: "Cola", description: "Classic", quantity: 30, price: 1.25 },
    { name: "Orange Juice", description: "Freshly squeezed", quantity: 25, price: 3.50 },
    { name: "Green Tea", description: "Sencha", quantity: 20, price: 2.99 },
    { name: "Coffee", description: "Ground", quantity: 35, price: 4.75 },
    { name: "Bottled Water", description: "Spring water", quantity: 40, price: 0.99 },
    { name: "Lemonade", description: "Refreshing", quantity: 30, price: 2.25 }
  ],
  condiments: [
    { name: "Ketchup", description: "Classic", quantity: 50, price: 1.75 },
    { name: "Mustard", description: "Dijon", quantity: 45, price: 2.25 },
    { name: "Mayonnaise", description: "Light", quantity: 40, price: 3.00 },
    { name: "Soy Sauce", description: "Low sodium", quantity: 30, price: 2.50 },
    { name: "Hot Sauce", description: "Habanero", quantity: 35, price: 4.99 },
    { name: "BBQ Sauce", description: "Smoky flavor", quantity: 40, price: 3.49 }
  ]
}

# Iterate through categories and create new instances of the categories

categories.each do |category|
  Category.create!(name: category[:name], description: category[:description], color: category[:color])
end

# Iterate through users and create new instances of the users

users.each do |user|
  User.create!(
    email: user[:email],
    password: user[:password]
  )
end

# Iterate through categories and then items to create new items associated to
# their respective categories

Category.all.each do |category|
  items[category.name.downcase.to_sym].each do |item|
    new_item = Item.new(
      category: category,
      name: item[:name],
      description: item[:description],
      quantity: item[:quantity],
      price: item[:price]
    )

    file = URI.open("https://source.unsplash.com/random/?#{item[:name]}")

    new_item.photo.attach(io: file, filename: "#{item[:name]}.png", content_type: "image/png")
    new_item.save
  end
end
