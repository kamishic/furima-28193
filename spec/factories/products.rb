FactoryBot.define do
  factory :product do
    name { '商品名テスト' }
    description { '説明テスト' }
    category_id { 1 }
    status_id { 1 }
    cost_ship_id { 1 }
    day_to_ship_id { 1 }
    area_from_ship_id { 1 }
    price { 300 }
    association :user
  end
end
