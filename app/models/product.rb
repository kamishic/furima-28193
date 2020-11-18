class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :status
  belongs_to :category
  belongs_to :cost_ship
  belongs_to :day_to_ship
  belongs_to :area_from_ship

  validates :image, presence: {message: "：出品画像を添付してください。"}
  validates :name, presence: { message: '：商品名をご入力ください。' }
  validates :description, presence: { message: '：商品の説明をご入力ください。' }

  validates :category_id, numericality: { other_than: 0 ,message: "：カテゴリーをご入力ください。"} 
  validates :status_id, numericality: { other_than: 0 ,message: "：商品の状態をご入力ください。"} 
  validates :cost_ship_id, numericality: { other_than: 0 ,message: "：配送料の負担をご入力ください。"} 
  validates :area_from_ship_id, numericality: { other_than: 0 ,message: "：発送元の地域をご入力ください。"} 
  validates :day_to_ship_id, numericality: { other_than: 0 ,message: "：発送までの日数をご入力ください。"} 

  validates :price, presence: {message: "：価格をご入力ください。"}
  VALID_PRICE_REGEX = /\A[0-9]+\z/i
  validates :price, format: { with: VALID_PRICE_REGEX, message: '：価格は半角数字でご入力ください。' }
  validates :price, numericality: { greater_than_or_equal_to:300,message:'：価格は300~9999999の範囲でご入力ください' }
  validates :price, numericality: { less_than_or_equal_to: 9999999,message:'：価格は300~9999999の範囲でご入力ください' }

end
