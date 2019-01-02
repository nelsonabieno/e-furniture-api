class AuthenticationController < ApplicationController
  skip_before_action :authenticate, only: [:create]


  def create
    @user = User.find_by(email: auth_params[:email])
    if @user
      @user.authenticate(auth_params[:password])
      jwt = issue({ user: @user.id })
      @user.update({ login_status: true })
      render json: { user: @user, jwt: jwt, message: 'You\'re in!' }
    elsif @user.nil?
      render json: { message: 'User does not exist' }, status: :not_found
    else
      render json: { message: 'Invalid login details', error: @user.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    if @current_user
      user = set_user
      user.update({ login_status: false })
      @current_user = nil
      render json: { message: 'Thanks for using our app, good bye' }, status: :ok
    elsif @current_user.nil?
      render json: { message: 'User does not exist' }, status: :not_found
    else
      render json: { message: 'You have to be logged in authentication',  error: @current_user.errors.full_messages }, status: :unauthorized
    end
  end

  private
  def auth_params
    params.permit(:email, :password)
  end

  def set_user
    User.find(@current_user.id) if  @current_user.id
  end

end
