class CartedProductsController < ApplicationController
  def create
    @carted_product = CartedProduct.create(
      product_id: params[:product_id],
      quantity: params[:quantity],
      user_id: current_user.id,
      status: "carted",
    )
    render :show
  end

  def index
    @carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")
    render :index
  end

  def destroy
    carted_product = current_user.carted_products.find_by(id: params[:id])
    carted_product.update(status: "removed")

    render json: { message: "Product successfully removed from cart" }
  end
end
