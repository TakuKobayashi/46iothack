# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

master_data_root = Rails.root.to_s + "/db/master_data"
files = Dir.glob(master_data_root + "/*")
files.each do |file_name|
  Product.connection.execute("TRUNCATE TABLE #{Product.table_name}")
  csv = File.read(file_name)
  records = csv.split("\n")
  headers = records.first.to_s.strip.split(",").select{|s| Product.column_names.include?(s) }
  products = []
  records[1..records.size].each do |rec|
  	product = Product.new
    cells = rec.strip.split(",")
    headers.each_with_index do |header, index|
      product.send(header + "=", cells[index])
    end
    if product.price_in_tax.present?
      products << product
    end
  end
  Product.import(products)
end