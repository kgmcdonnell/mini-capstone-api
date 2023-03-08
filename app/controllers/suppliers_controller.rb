class SuppliersController < ApplicationController
  def index
    render json: Supplier.all.as_json
  end

  def create
    supplier = Supplier.create(
      name: params[:name],
      email: params[:email],
      phone_number: params[:phone_number],
    )
    if supplier.valid?
      render json: supplier.as_json
    else
      render json: { error: supplier.errors.full_messages }, status: 422
    end
  end
end
