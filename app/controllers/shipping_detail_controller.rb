class ShippingDetailController < ApplicationController
  before_action :find_shipping_details, only: [:show, :update, :destroy]

  def index
    @shipping_details = ShippingDetail.all
    render json: { shipping_details: @shipping_details }, status: :ok
  end

  def create
    shipping_detail = ShippingDetail.new(shipping_details_params)

    if shipping_detail.valid?
      shipping_detail.save
      render json: { message: 'shipping detail successfully registered' }, status: :ok
    else
      render json: { errors: shipping_detail.errors.full_messages }, status: :internal_server_error
    end
  end

  def show
    render json: { product: @shipping_detail }, status: :ok
  end

  def edit
    render json: { shipping_detail: @shipping_detail }, status: :ok
  end

  def update
    if @shipping_detail.update(shipping_details_params)
      render json: { shipping_detail: @shipping_detail, message: 'shipping detail successfully updated' }, status: :ok
    else
      render json: { shipping_detail: @shipping_detail, errors: @shipping_detail.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    if @shipping_detail.destroy
      render json: { shipping_detail: @shipping_detail, message: 'shipping detail successfully deleted' }, status: :ok
    else
      render json: { shipping_detail: @shipping_detail, errors: @shipping_detail.errors.full_messages }, status: :internal_server_error
    end

  end

  private
  def shipping_details_params
    params.permit(
        :recipient_name,
        :recipient_address,
        :order_no,
        :lg_id,
        :state_id,
        :phone_no,
        :city,
        :user_id
    )
  end

  def find_shipping_details
    @shipping_detail = ShippingDetail.find(params(:id))
  end

end
