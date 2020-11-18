class ProductsController < ApplicationController
  before_action :move_to_index,except: [:index]
  
  def index
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


  private
  def product_params
    params.require(:product).permit(:content, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
