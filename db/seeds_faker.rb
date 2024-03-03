# db/seeds.rb

require 'faker'

# Clear existing records
Category.destroy_all
Product.destroy_all

# Seed categories
5.times do
  Category.create(name: Faker::Commerce.department)
end

# Seed products
categories = Category.all

categories.each do |category|
  10.times do
    Product.create(
      title: Faker::Commerce.product_name,
      description: Faker::Lorem.paragraph,
      price: Faker::Commerce.price,
      stock_quantity: Faker::Number.between(from: 1, to: 100),
      category: category
    )
  end
end

puts 'Seed data created successfully!'
