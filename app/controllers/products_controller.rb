class ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]

  def index
    @products = Product.all

    if params[:category]
      category = Category.find_by(name: params[:category])
      @products = category.products
    end

    render template: "products/index"
  end

  def show
    products_id = params[:id]
    @product = Product.find_by(id: products_id)
    render template: "products/show"
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      # image_url: params[:image_url],
      description: params[:description],
      inventory: params[:inventory],
      supplier_id: params[:supplier_id],
    )

    if @product.save
      image = Image.new(
        url: params[:url],
        product_id: @product.id,
      )
      image.save
      render template: "products/show"
    else
      render json: { error: @product.errors.full_messages }, status: 422
    end
  end

  def update
    product_id = params[:id]
    @product = Product.find(product_id)
    @product.update(
      name: params[:name] || @product.name,
      price: params[:price] || @product.price,
      # image_url: params[:image_url] || @product.image_url,
      description: params[:description] || @product.description,
    )
    if @product.valid?
      render template: "products/show"
    else
      render json: { error: @product.errors.full_messages }, status: 422
    end
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    render json: { message: "Delete was successful!" }
  end
end
