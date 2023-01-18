# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
product = Product.new(name: "pen", price: 3, image_url: "image.jpeg", description: "a tool to write or draw on a piece of paper")
product.save!

product = Product.new(name: "Screwdriver", price: 9, image_url: "image.jpeg", description: "a tool used to drive screws into surfaces")
product.save!
