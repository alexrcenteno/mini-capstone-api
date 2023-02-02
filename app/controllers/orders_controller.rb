class OrdersController < ApplicationController
  before_action :authenticate_user

  def create
    carted_products = @carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")
    subtotal = 0
    tax = 0
    total = 0

    carted_products.each do |carted_product|
      product = carted_product.product
      quantity = carted_product.quantity
      subtotal += quantity * product.price
      tax += quantity * product.tax
      total += subtotal + tax
    end

    @order = Order.create(
      user_id: current_user.id,
      subtotal: subtotal,
      tax: tax,
      total: total,
    )

    if @order.valid?
      carted_products.update_all(status: "purchased", order_id: @order.id)
    end

    render :show
  end

  def show
    @order = current_user.orders.find_by(id: params[:id])

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
