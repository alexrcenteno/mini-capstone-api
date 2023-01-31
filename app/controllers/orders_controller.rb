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

    if current_user && current_user.id == @order.user_id
      render :show
    else
      render json: {}, status: :unauthorized
    end
  end

  def index
    if current_user
    @orders = current_user.orders
    render :index
    else
      render json {}, status :unauthorized
    end
  end
end
