class OrdersController < ApplicationController
  def create
    product = Product.find_by(id: params[:product_id])
    quantity = params[:quantity].to_i
    subtotal = quantity * product.price
    tax = quantity * product.tax
    total = subtotal + tax

    @order = Order.create(
      product_id: params[:product_id],
      quantity: quantiy,
      subtotal: subtotal,
      tax: tax,
      total: total,
      user_id: current_user.id,
    )
    render :show
  end

  def show
    @order = Order.find_by(id: params[:id])
    render :show
  end

  def index
    @orders = Order.all
    render :index
  end
end
