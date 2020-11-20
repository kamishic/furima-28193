class Ship < ApplicationRecord
  belongs_to :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area_from_ship

  validates :zipcode, presence: { message: '：郵便番号をご入力ください。' }
  VALID_ZIPCODE_REGEX = /\A\d{3}-\d{4}\z/.freeze
  validates :zipcode, format: { with: VALID_ZIPCODE_REGEX, message: '：郵便番号はxxx-xxxxの形でご入力ください。' }

  validates :prefecture_id, numericality: { other_than: 0, message: '：都道府県をご入力ください。' }
  validates :city, presence: { message: '：市区町村をご入力ください。' }
  validates :block, presence: { message: '：番地をご入力ください。' }

  validates :phone, presence: { message: '：電話番号をご入力ください。' }
  VALID_PHONE_REGEX = /\A\d{1,11}\z/.freeze
  validates :phone, format: { with: VALID_PHONE_REGEX, message: '：電話番号は11桁以内の半角数字でご入力ください。' }
end
