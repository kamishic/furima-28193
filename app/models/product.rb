class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :status
  belongs_to :category
  belongs_to :cost_ship
  belongs_to :day_to_ship
  belongs_to :area_from_ship

  validates :status_id, numericality: { other_than: 0 } 
  validates :category_id, numericality: { other_than: 0 } 


end
