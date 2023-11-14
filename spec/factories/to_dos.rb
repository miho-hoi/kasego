FactoryBot.define do
  factory :to_do do
    content {Faker::Lorem.sentence}
    price   {Faker::Number.between(from: 10, to: 1000)}
  end
end
