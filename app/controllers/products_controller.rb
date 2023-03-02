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
      name: "Satin Ultra Petite Scrunchies",
      price: 10.00,
      image_url: "https://media.ulta.com/i/ulta/2607115?w=720&fmt=webp",
      description: "Crafted with eco-friendly satin, these accessories are gentle on your strands and help reduce damage to your hair.",
    )
    product.save
    render json: product
  end
end
