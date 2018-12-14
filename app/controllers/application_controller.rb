class ApplicationController < ActionController::API
  include Authentication

  before_action :authenticate
  skip_before_action :authenticate, only: [:create]

  def logged_in?
    !! current_user
  end

  def current_user
    if auth_present?
      user = User.find(auth['user'])
      if user && user.login_status
        @current_user ||= user
      end
    end
  end

  def authenticate
    render json: { message: 'You have to be logged in application ', auth_guy: auth['user'], error: @current_user.errors.full_messages  }, status: :unauthorized unless logged_in?
  end

  private

  def token
    request.headers['Authorization'].sub("Bearer ","")
  end

  def auth
    decode(token)
  end

  def auth_present?
    !!request.headers['Authorization'].scan(/Bearer/).flatten.first
  end
end
