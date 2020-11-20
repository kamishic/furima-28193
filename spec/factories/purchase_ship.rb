FactoryBot.define do
  factory :purchase_ship do
    zipcode { '123-4567' }
    prefecture_id { 1 }
    city { '○○市○○区' }
    block { '○○番地' }
    building { '○○マンション101' }
    phone { '12345678901' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
