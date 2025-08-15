# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

# Create categories
categories = %w[Pottery Jewelry HomeDecor].map do |name|
	Category.create!(name: name)
end

# Create products
Product.create!([
	{ name: 'Handmade Cup', description: 'A beautiful handmade pottery cup.', price: 25.0, stock_quantity: 20, category: categories[0] },
	{ name: 'Artisan Bowl', description: 'Unique bowl for your kitchen.', price: 35.0, stock_quantity: 15, category: categories[0] },
	{ name: 'Silver Necklace', description: 'Custom silver jewelry.', price: 50.0, stock_quantity: 10, category: categories[1] },
	{ name: 'Wall Hanging', description: 'Decorate your home with style.', price: 40.0, stock_quantity: 8, category: categories[2] }
])

# Create admin
Admin.find_or_initialize_by(name: 'Admin').tap do |admin|
	admin.email = 'admin@gmail.com'
	admin.password = 'password'
	admin.password_confirmation = 'password'
	admin.save!
end

# Create a user
test_user = User.create!(name: 'Test User', email: 'user@example.com', password: 'password', password_confirmation: 'password', address: '123 Main St', phone: '555-1234')

# Create an order
test_order = Order.create!(user: test_user, total_price: 60.0, status: 'pending')
OrderItem.create!(order: test_order, product: Product.first, quantity: 2, price_at_order: 25.0)

# Create a review
Review.create!(user: test_user, product: Product.first, rating: 5, comment: 'Excellent quality!')
