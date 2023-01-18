class ProductsController < ApplicationController
  def one_product
    product = Product.first
    render template: "products/show"
  end
end
