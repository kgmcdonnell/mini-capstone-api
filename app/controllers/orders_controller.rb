class OrdersController < ApplicationController
  def create
    subtotal = params[:quantity] * Product.find_by(id: params[:product_id]).price
    tax = subtotal * 0.09
    total = subtotal + tax
    @order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: subtotal,
      tax: tax,
      total: total,
    )
    if @order.save
      render json: { message: "order successfully created!" }, status: 200
    else
      render json: { errors: order.errors.full_messages }, status: :bad_request
    end
  end

  def show
    order_id = params[:id]
    @order = Order.where(user_id: current_user).find_by(id: order_id)
    if @order
      render template: "orders/show"
    else
      render json: { errors: "order does not exist" }, status: :bad_request
    end
  end

  def index
    @orders = current_user.orders
    render template: "orders/index"
  end
end
