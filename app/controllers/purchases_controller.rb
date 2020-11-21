class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_product, only: [:index, :create]
  before_action :soldout?, only: [:index, :create]

  def index
    redirect_to root_path if @product.user.id == current_user.id
    @purchase_ship = PurchaseShip.new
  end

  def create
    @purchase_ship = PurchaseShip.new(purchase_ship_params)
    if @purchase_ship.save(purchase_ship_params)
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_product
    @product = Product.includes(:user).find(params[:product_id])
  end

  def purchase_ship_params
    params.permit(:zipcode, :prefecture_id, :city, :block, :building, :phone, :product_id, :token).merge(user_id: current_user.id, price: @product.price)
  end

  def soldout?
    redirect_to root_path if @product.purchase
  end
end
