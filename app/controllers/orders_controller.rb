class OrdersController < ApplicationController
  #check to make sure a user is logged in
  before_action :authenticate_user

  def index
    @orders = current_user.orders
    render template: "orders/index"
  end

  def create
    subtotal = params[:quantity].to_i * Product.find_by(id: params[:product_id]).price
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
      render template: "orders/show"
    else
      render json: { errors: @order.errors.full_messages }, status: 422
    end
  end

  def show
    order_id = params[:id]
    @order = current_user.orders.find_by(id: order_id)
    render template: "orders/show"
  end
end
