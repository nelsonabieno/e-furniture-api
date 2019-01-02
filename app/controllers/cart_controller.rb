class CartController < ApplicationController
  before_action :find_cart, only: [:show, :update, :destroy]

  def index
    # @cart = Cart.includes(:products) Eager load products with carts
    @cart = Cart.all
    render json: { carts: @cart }, status: :ok
  end

  def create
    cart = Cart.new(cart_params)

    if cart.valid?
      cart.save
      render json: { message: 'Cart successfully registered' }, status: :ok
    else
      render json: { errors: cart.errors.full_messages }, status: :internal_server_error
    end
  end

  def show
    render json: { cart: @cart }, status: :ok
  end

  def update
    if @cart.update(cart_params)
      render json: { cart: @cart, message: 'Cart successfully updated' }, status: :ok
    else
      render json: { cart: @cart, errors: @cart.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    if @cart.destroy
      render json: { cart: @cart, message: 'Cart successfully deleted' }, status: :ok
    else
      render json: { cart: @cart, errors: @cart.errors.full_messages }, status: :internal_server_error
    end
  end

  private

  def cart_params
    params.permit(
        :transaction_id, :product_id, :qty, :price, :total_amount, :user_id, :cart_no)
  end

  def find_cart
    @cart = Cart.find(params[:id])
  end

end
