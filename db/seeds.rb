Product.destroy_all
Product.create!([
  { name: "pen", price: "3.0", image_url: "image.jpeg", description: "a tool to write or draw on a piece of paper" },
  { name: "Screwdriver", price: "9.0", image_url: "image.jpeg", description: "a tool used to drive screws into surfaces" },

])
