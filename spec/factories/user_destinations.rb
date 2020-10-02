FactoryBot.define do
  factory :user_destination do
    postal_code { '123-4567' }
    shipping_from_id { 2 }
    municipalities { '青山' }
    address { '1-1' }
    building { '東京ハイツ' }
    telephone_number { 12_345_678_901 }
    token { 'aaa' }
  end
end
