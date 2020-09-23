FactoryBot.define do
  factory :item do
    name                  { Faker::Name.initials(number: 5) }
    price                 { '1000' }
    introduction          { '紹介文です' }
    category_id           { '2' }
    condition_id          { '2' }
    shipping_fee_id       { '2' }
    shipping_from_id      { '2' }
    date_of_shipment_id   { '2' }
    association :user

    after(:build) do |item_image|
      item_image.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end

end
