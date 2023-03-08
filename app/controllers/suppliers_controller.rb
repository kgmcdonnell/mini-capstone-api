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

  def update
    supplier_id = params[:id]
    supplier = Supplier.find(supplier_id)
    supplier.update(
      name: params[:name] || supplier.name,
      email: params[:email] || supplier.email,
      phone_number: params[:phone_number] || supplier.phone_number,
    )
    if supplier.valid?
      render json: supplier.as_json
    else
      render json: { error: supplier.errors.full_messages }, status: 422
    end
  end

  def destroy
    supplier = Supplier.find_by(id: params[:id])
    supplier.destroy
    render json: { message: "Delete was successful!" }
  end
end
