class ApplicationController < ActionController::API
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
    render json: { message: 'You have to be logged in' }, status: :unauthorized unless logged_in?
  end

  private

  def token
    request.env['HTTP_HTTP_HTTP_HTTP_AUTHORIZATION'].scan(/Bearer(.*)$/).flatten.last
  end

  def auth
    @auth = Auth::Authentication.new
    @auth.decode(token)
  end

  def auth_present?
    !!request.env.fetch('HTTP_HTTP_HTTP_HTTP_AUTHORIZATION', '').scan(/Bearer/).flatten.first
  end
end
