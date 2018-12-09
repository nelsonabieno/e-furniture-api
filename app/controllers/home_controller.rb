class HomeController < ApplicationController
  skip_before_action :authenticate, only: [:index]
  def index
    render json: { message: 'welcome to qontactsky contact mgt app'}, status: :ok
  end
end
