FactoryBot.define do
  factory :payment do
    date { Faker::Date.between(from: Date.today, to: Date.today) }
    total_price { Faker::Number.between(from: 10, to: 5000)}
    association :user
  end
end
