FactoryBot.define do
  factory :order_form do
    item_id { 1 }
    user_id { 1 }
    post { '123-4567' }
    prefecture_id { 2 }
    municipality { '東京都' }
    address { '1-1' }
    construction { '東京ハイツ' }
    phone { Faker::Number.number(digits: 10).to_s }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
