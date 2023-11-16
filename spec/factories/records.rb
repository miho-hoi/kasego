FactoryBot.define do
  factory :record do
    date { Faker::Date.between(from: Date.today, to: Date.today) }
    times {Faker::Number.between(from: 1, to: 10)}
    association :user
    association :to_do
  end
end
