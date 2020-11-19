class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_product, only: [:show, :edit, :update]

  def index
    @products = Product.order(created_at: 'DESC')
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    redirect_to product_path(@product.id) if @product.user_id != current_user.id
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(params[:id])
    else
      render :edit
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :image, :description, :category_id, :status_id, :cost_ship_id, :area_from_ship_id, :day_to_ship_id, :price).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.includes(:user).find(params[:id])
  end
end
