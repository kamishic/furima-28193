class PurchasesController < ApplicationController
  before_action :set_product, only: [:index, :create]

  def index
    @purchase_ship = PurchaseShip.new
  end

  def create
    puts("-----------------params")
    puts(params)

    @purchase_ship = PurchaseShip.new
    @purchase_ship.save(purchase_params,ship_params,payjp_params)
    render :index
  end

  private 
  def set_product
    @product = Product.includes(:user).find(params[:product_id])
  end
  def ship_params
    params.permit(:zipcode, :prefecture_id, :city,:block,:building,:phone)
  end
  def purchase_params
    params.permit(:product_id).merge(user_id: current_user.id)
  end
  def payjp_params
    params.permit(:token).merge(price: @product.price)
  end

end
