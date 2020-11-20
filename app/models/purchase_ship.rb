class PurchaseShip
  include ActiveModel::Model
  attr_accessor :zipcode,:prefecture_id,:city,:block,:building,:phone,
                :user_id,:product_id,:token,:price

  validates :zipcode, presence: { message: '：aaa郵便番号をご入力ください。' }
  validates :prefecture_id, numericality: { other_than: 0, message: '：都道府県をご入力ください。' }
  validates :city, presence: { message: '：市区町村をご入力ください。' }
  validates :block, presence: { message: '：番地をご入力ください。' }
  validates :phone, presence: { message: '：電話番号をご入力ください。' }

  validates :token, presence: { message: '：トークンが未生成です。' }

  def save(purchase_params,ship_params,payjp_params)
    return if invalid?

    purchase = Purchase.create(purchase_params)
    Ship.create(ship_params.merge(purchase_id: purchase.id))

    Payjp.api_key = "sk_test_b729897a0885c3a373351701"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: payjp_params[:price],  # 商品の値段
      card: payjp_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )

  end

end