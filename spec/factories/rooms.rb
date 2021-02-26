FactoryBot.define do
  factory :room do
    name { Faker::Team.name }
    price { 0.94 }
    currency_id { 1 }
  end
end
