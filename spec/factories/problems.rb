FactoryBot.define do
  factory :problem do
    title { Faker::Team.name }
    content { Faker::Lorem.sentence }
    category_id { 3 }
    association :user
  end
end
