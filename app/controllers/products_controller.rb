class ProductsController < ApplicationController
  def all_products
    render json: Product.all.as_json
  end

  def perfume
    render json: Product.find_by(id: 1)
  end

  def hair_tools
    render json: Product.find_by(id: 3)
  end

  def foundation
    render json: Product.find_by(id: 2)
  end

  def cleanser
    render json: Product.find_by(id: 4)
  end

  def lip_products
    render json: Product.find_by(id: 5)
  end
end
