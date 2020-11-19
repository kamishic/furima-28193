class PurchaseShip
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_orig_id, :city, :address_other, :building_name, 
                :telephone_num, :sell_item_id, :user_id, :buy_item_id


end