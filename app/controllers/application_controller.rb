class ApplicationController < ActionController::API
  include Authentication

  before_action :authenticate
  skip_before_action :authenticate, only: [:create]

  def logged_in?
    !! current_user
  end

  def current_user
    begin
      if auth_present? && auth['user'].present?
        user = User.find(auth['user'])
        if user && user.login_status
          @current_user ||= user
        end
      end
    rescue
      render json: {message: 'Sorry, we couldn\'t copnfirm you as a user, pls contact the admin' }, status: :unauthorized
    end
  end

  def authenticate
    render json: { message: 'You have to be logged in application ', auth_guy: auth['user'] }, status: :unauthorized unless logged_in?
    return
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
