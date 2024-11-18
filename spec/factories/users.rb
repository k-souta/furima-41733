FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials }
    email { Faker::Internet.email }
    password { 'a1' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name { 'ああ' }
    last_name_katakana { 'アア' }
    name { 'あああ' }
    name_katakana { 'アアア' }
    birth { Faker::Date.between(from: '1930-01-01', to: '2019-12-31') }
  end
end
