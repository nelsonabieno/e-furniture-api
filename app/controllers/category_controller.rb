class CategoryController < ApplicationController
  before_action :find_category, only: [:show, :update, :destroy]
  skip_before_action :authenticate, only: [:index,:show]

  def index
    @categories = Category.all
    render json: { categories: @categories }, status: :ok
  end

  def create
    category = Category.new(category_params)

    if category.valid?
      category.save
      render json: { message: 'category successfully registered' }, status: :ok
    else
      render json: { errors: category.errors.full_messages }, status: :internal_server_error
    end
  end

  def show
    render json: { category: @category }, status: :ok
  end

  def update
    if @category.update(category_params)
      render json: { category: @category, message: 'shipping detail successfully updated' }, status: :ok
    else
      render json: { category: @category, errors: @category.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    if @category.destroy
      render json: { category: @category, message: 'category successfully deleted' }, status: :ok
    else
      render json: { category: @category, errors: @category.errors.full_messages }, status: :internal_server_error
    end

  end

  private
  def category_params
    params.permit(
        :name
    )
  end

  def find_category
    @category = Category.find(params[:id])
  end

end
