class UserController < ApplicationController
  before_action :set_user, only: [:destroy, :show, :edit, :update]

  def index
    @users = User.all
    render json: { users: @users }, status: :ok
  end

  def create
    user = User.new(user_params)
    address = Address.new(address_params)
    user.role_id = 3
    user.login_status = false

    if user.valid? && user.save
      last_user = User.last
      address.user_id = last_user.id
      address.save
      render json: { message: 'user successfully registered' }, status: :ok
    else
      render json: { errors: user.errors.full_messages }, status: :internal_server_error
    end
  end

  def show
    render json: { user: @user }, status: :ok
  end

  def update
    if @user.update(user_params)
      render json: { user: @user, message: 'user successfully updated' }, status: :ok
    else
      render json: { user: @user, errors: @user.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    if @user.destroy
      render json: { user: @user, message: 'user successfully deleted' }, status: :ok
    else
      render json: { user: @user, errors: @user.errors.full_messages }, status: :internal_server_error
    end
  end

  private

  def user_params
    params.permit(
        :first_name,
        :last_name,
        :phone_no,
        :email,
        :password,
        :login_status,
        :profile_img
    )
  end

  def address_params
    params.permit(
        :street_address,
        :lga,
        :city,
        :state
    )
  end

  def set_user
    @user = User.find(params[:id])
  end
end
