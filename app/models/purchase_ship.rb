class PurchaseShip
  include ActiveModel::Model
  attr_accessor :zipcode, :prefecture_id, :city, :block, :building, :phone,
                :user_id, :product_id, :token, :price

  VALID_ZIPCODE_REGEX = /\A\d{3}-\d{4}\z/.freeze
  VALID_PHONE_REGEX = /\A\d{1,11}\z/.freeze

  with_options presence: true do
    validates :zipcode, format: { with: VALID_ZIPCODE_REGEX, message: '：郵便番号はxxx-xxxxの形でご入力ください。' }
    validates :phone, format: { with: VALID_PHONE_REGEX, message: '：電話番号は11桁以内の半角数字でご入力ください。' }
    validates :city
    validates :block
    validates :token
  end

  validates :prefecture_id, numericality: { other_than: 0, message: '：都道府県をご入力ください。' }

  def save(params)
    return if invalid?

    purchase_params = params.slice(:user_id, :product_id)
    ship_params = params.slice(:zipcode, :prefecture_id, :city, :block, :building, :phone)
    payjp_params = params.slice(:token, :price)

    purchase = Purchase.new(purchase_params)
    purchase.save

    ship = Ship.new(ship_params.merge(purchase_id: purchase.id))
    if ship.save
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      Payjp::Charge.create(
        amount: payjp_params[:price],  # 商品の値段
        card: payjp_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
      true
    else
      false
    end
  end
end
