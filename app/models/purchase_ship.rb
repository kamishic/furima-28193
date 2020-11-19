class PurchaseShip
  include ActiveModel::Model
  attr_accessor :zipcode,:prefecture_id,:city,:block,:building,:phone,:user_id,:token

  validates :zipcode, presence: { message: '：郵便番号をご入力ください。' }
  validates :prefecture_id, numericality: { other_than: 0, message: '：都道府県をご入力ください。' }
  validates :city, presence: { message: '：市区町村をご入力ください。' }
  validates :block, presence: { message: '：番地をご入力ください。' }
  validates :phone, presence: { message: '：電話番号をご入力ください。' }

  def save(purchase_params,ship_params,pay_jp_params)
    puts("purchase_params")
    puts(purchase_params)
    puts("ship_params")
    puts(ship_params)
    puts("pay_jp_params")
    puts(pay_jp_params)    

    purchase = Purchase.create(purchase_params)
    Ship.create(ship_params.merge(purchase_id: purchase.id))
  end

end