class UserController < ApplicationController
  before_action :user_params

  def index

  end

  def create
    user = User.new(user_params)
    user.role_id = 3
    user.login_status = false

    if user.valid?
      user.save!
      render json: { message: 'user successfully registered' }, status: :ok
    else
      render json: { errors: user.errors.full_messages }, status: :internal_server_error
    end
  end

  def show

  end

  def update

  end

  def destroy

  end

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
end
