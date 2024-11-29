FactoryBot.define do
  factory :item do
    item_name { 'test' }
    item_explanation { 'テスト' }
    category_id { 2 }
    cost_id { 2 }
    cost_load_id { 2 }
    prefecture_id { 5 }
    hidzuke_id { 2 }
    price { '1000' }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
