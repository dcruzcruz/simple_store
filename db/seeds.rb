require 'csv'
# Define a method to convert CSV rows to hash
def csv_to_hash(row)
  {
    title: row['name'],
    description: row['description'],
    price: row['price'].to_d, # Convert to decimal
    stock_quantity: row['stock quantity'].to_i, # Convert to integer
    category_id: Category.find_or_create_by(name: row['category']).id
  }
end
# Load CSV file and seed products
csv_path = Rails.root.join('db', 'products.csv') # Update with the correct path
csv_data = CSV.read(csv_path, headers: true)
csv_data.each do |row|
  Product.create(csv_to_hash(row))
end
puts 'Products seeded successfully!'