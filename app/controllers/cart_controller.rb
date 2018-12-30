class CartController < ApplicationController
  before_action :find_cart, only: [:show, :update, :destroy]

  def index
    @cart = Cart.all.include(:products)
    render json: { carts: @cart }, status: :ok
  end

  def create
    cart = cart.new(cart_params)

    if cart.valid?
      cart.save
      render json: { message: 'cart successfully registered' }, status: :ok
    else
      render json: { errors: cart.errors.full_messages }, status: :internal_server_error
    end
  end

  def edit
    render json: { cart: @cart }, status: :ok
  end

  def update
    if @cart.update(cart_params)
      render json: { cart: @cart, message: 'order detail successfully updated' }, status: :ok
    else
      render json: { cart: @cart, errors: @cart.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    if @cart.destroy
      render json: { cart: @cart, message: 'cart successfully deleted' }, status: :ok
    else
      render json: { cart: @cart, errors: @cart.errors.full_messages }, status: :internal_server_error
    end
  end

  private
  def cart_params
    params.permit(
        :transanction_id,
        :product_id,
        :qty,
        :price,
        :total_amount,
        :user_id,
        :cart_no,
    )
  end

  def find_order
    @cart = cart.find(params(:id))
  end

end
