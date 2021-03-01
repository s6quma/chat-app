FactoryBot.define do
  factory :room do
    name { Faker::Team.name }
    manager { 1 }
    price { 0.94 }
    currency_id { 1 }
  end
end
