class HomeController < ApplicationController
  skip_before_action :authenticate, only: [:index]
  def index
    render json: { message: 'welcome to ninjafurniturz e-commerce app'}, status: :ok
  end
end
