# db/seeds.rb
require 'csv'
require 'faker'

# Clear out the products and categories tables
Product.destroy_all
Category.destroy_all

# Loop through the rows of a CSV file
csv_file = Rails.root.join('db/products.csv')
csv_data = File.read(csv_file)
products = CSV.parse(csv_data, headers: true)

products.each do |product|
  # Create or find the associated category
  category = Category.find_or_create_by(name: product['category'])

  # Create products
  Product.create(
    title: product['title'],
    description: Faker::Lorem.paragraph,
    price: product['price'],
    stock_quantity: product['stock_quantity'],
    category: category
  )
end
