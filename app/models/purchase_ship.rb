class PurchaseShip
  include ActiveModel::Model
  attr_accessor :zipcode,:prefecture_id,:city,:block,:building,:phone,:user_id




  def save(purchase_params,ship_params)
    purchase = Purchase.create(purchase_params)
    Ship.create(ship_params.merge(purchase_id: purchase.id))
  end

end