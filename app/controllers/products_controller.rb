class ProductsController < ApplicationController
  def all_products
    render json: Product.all.as_json
  end
end
