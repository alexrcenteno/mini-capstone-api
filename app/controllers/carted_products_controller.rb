class CartedProductsController < ApplicationController
  def create
    @carted_product = CartedProduct.new(
      product_id: params[:product_id],
      quantity: params[:quantity],
      user_id: current_user.id,
      status: "carted",
    )

    if @carted_product.save
      render json: { message: "Carted product successfully created" }
    else
      render json: { error: @carted_product.errors.full_messages }, status: bad_request
    end
  end

  def index
    @carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")
    render json: @carted_products
  end
end
