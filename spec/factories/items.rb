FactoryBot.define do
  factory :item do
    name          { Faker::Name.name }
    description { Faker::Lorem.sentence }
    price { Faker::Number.between(300, 9_999_999) }
    category_id { '3' }
    status_id { '3' }
    shopping_fee_id { '3' }
    prefecture_id { '3' }
    delivery_days_id { '3' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
