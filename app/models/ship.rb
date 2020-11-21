class Ship < ApplicationRecord
  belongs_to :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area_from_ship

  with_options presence: true do
    validates :zipcode, format: { with: VALID_ZIPCODE_REGEX, message: '：郵便番号はxxx-xxxxの形でご入力ください。' }
    validates :phone, format: { with: VALID_PHONE_REGEX, message: '：電話番号は11桁以内の半角数字でご入力ください。' }
    validates :city
    validates :block
    validates :token
  end
  validates :prefecture_id, numericality: { other_than: 0, message: '：都道府県をご入力ください。' }
end
