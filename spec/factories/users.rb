FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 3) }
    email                 { Faker::Internet.free_email }
    password              { 'abc123' }
    password_confirmation { password }
    family_name           { '亜' }
    first_name            { '亜' }
    family_name_kana      { 'ア' }
    first_name_kana       { 'ア' }
    birthday              { Faker::Date.between(from: '1900-01-01', to: '2099-12-31') }
  end
end
