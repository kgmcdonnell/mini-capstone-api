class OrdersController < ApplicationController
  def index
    if current_user
      @orders = current_user.orders
      render template: "orders/index"
    else
      render json: [], status: :unauthorized
    end
  end

  def create
    if current_user
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
    else
      render json: [], status: :unauthorized
    end
  end

  def show
    order_id = params[:id]
    @order = current_user.orders.find_by(id: order_id)

    render template: "orders/show"
  end
end
