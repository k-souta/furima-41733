FactoryBot.define do
  factory :order_form do
    item_id { 1 }
    user_id { 1 }
    post { '123-4567' }
    prefecture_id { 2 }
    municipality { '東京都' }
    address { '1-1' }
    construction { '東京ハイツ' }
    phone { '0' + Faker::Number.between(from: 100_000_000, to: 9_999_999_999).to_s }
  end
end
