class ProductsController < ApplicationController
  def index
    render json: Product.all.as_json
  end

  def show
    products_id = params[:id]
    product = Product.find_by(id: products_id)
    render json: product.as_json
  end
end
