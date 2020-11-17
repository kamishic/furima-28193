FactoryBot.define do
  factory :user do
    nickname { "nickname_test" }
    email {Faker::Internet.free_email} 
    password {"1qaz3edc"}
    password_confirmation {"1qaz3edc"}
    lastname {"山田"}
    firstname {"太郎"}
    kana_lastname {"ヤマダ"}
    kana_firstname {"タロウ"}
    birthday {Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end