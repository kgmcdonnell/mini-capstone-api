class ProductsController < ApplicationController
  def index
    render json: Product.all.as_json
  end

  def show
    products_id = params[:id]
    product = Product.find_by(id: products_id)
    render json: product.as_json
  end

  def create
    product = Product.new(
      name: params[:name],
      price: params[:price],
      image_url: params[:image_url],
      description: params[:description],
    )
    if product.save
      render json: product.as_json
    else
      render json: { error: product.errors.full_messages }, status: 422
    end
  end

  def update
    product_id = params[:id]
    product = Product.find(product_id)
    product.update(
      name: params[:name] || product.name,
      price: params[:price] || product.price,
      image_url: params[:image_url] || product.image_url,
      description: params[:description] || product.description,
    )
    if product.valid?
      render json: product.as_json
    else
      render json: { error: product.errors.full_messages }, status: 422
    end
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
    render json: { message: "Delete was successful!" }
  end
end
