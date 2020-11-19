class Ship < ApplicationRecord
  belongs_to :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area_from_ship

  validates :zipcode, presence: { message: '：郵便番号をご入力ください。' }
  validates :prefecture_id, numericality: { other_than: 0, message: '：都道府県をご入力ください。' }
  validates :city, presence: { message: '：市区町村をご入力ください。' }
  validates :block, presence: { message: '：番地をご入力ください。' }
  validates :phone, presence: { message: '：電話番号をご入力ください。' }

end
