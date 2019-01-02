class OrderController < ApplicationController
  before_action :find_order, only: [:show, :update, :destroy]

  def index
    @orders = Order.all
    render json: { orders: @orders }, status: :ok
  end

  def create
    # I think payment integration should go here: https://github.com/IkoroVictor/paystack-ruby
    order = Order.new(order_params)
    if order.valid?
      order.save
      render json: { message: 'order successfully registered' }, status: :ok
    else
      render json: { errors: order.errors.full_messages }, status: :internal_server_error
    end
  end

  def edit
    render json: { order: @order }, status: :ok
  end

  def update
    if @order.update(order_params)
      render json: { order: @order, message: 'order detail successfully updated' }, status: :ok
    else
      render json: { order: @order, errors: @order.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    if @order.destroy
      render json: { order: @order, message: 'order successfully deleted' }, status: :ok
    else
      render json: { order: @order, errors: @order.errors.full_messages }, status: :internal_server_error
    end

  end

  private
  def order_params
    params.permit(
        :transanction_id,
        :order_no,
        :product_id,
        :order_status
    )
  end

  def find_order
    @order = Order.find(params[:id])
  end

end
