class ProductController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]

  def index
    @products = Product.all
    render json: { products: @products }, status: :ok
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      render json: { product: @product }, status: :ok
    else
      render json: { errors: @product.errors.full_messages }, status: :bad_request
    end

  end

  def show
      render json: { product: @product }, status: :ok
  end

  def update
    if @product.update(product_params)
      render json: { product: @product, message: 'product successfully updated' }, status: :ok
    else
      render json: { product: @product, errors: @product.errors.full_messages }, status: :bad_request
    end
  end

  def destroy

    if @product.destroy
      render json: { product: @product, message: 'product successfully deleted' }, status: :ok
    else
      render json: { product: @product, errors: @product.errors.full_messages }, status: :internal_server_error
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])

  end

  def product_params
    params.permit( :name, :description, :color, :material, :image_front, :image_back,
                  :image_left, :image_right, :price, :brand, :size, :user_id )
  end
end
