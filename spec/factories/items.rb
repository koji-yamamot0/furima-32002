FactoryBot.define do
  factory :item do
    title {Faker::Name.name}
    image {}
    category_id { 2 }
    text {Faker::Lorem.sentence}
    price { 3000 }
    delivery_fee_id { 2 }
    ship_from_location_id { 2 }
    shipping_date_id { 2 }
    item_status_id { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
