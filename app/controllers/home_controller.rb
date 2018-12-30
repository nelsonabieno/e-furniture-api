class HomeController < ApplicationController
  skip_before_action :authenticate, only: [:index]
  def index
    render json: { message: 'welcome to ninjafurniturz e-commerce app'}, status: :ok
  end

  def path_not_found
    render json: { message: 'Ops! We couldn\'t find what you are looking for'}, status: :not_found
  end
end
