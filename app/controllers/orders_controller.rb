class OrdersController < ApplicationController
  before_action :authenticate_user

  def create
    if current_user
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
    else 
     render json: {}, :unauthorized
    end
  end

  def show
    @order = current_user.order.find_by(id: params[:id])

    if @order
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
      render json: {}, status: :unauthorized
    end
  end
end
