FactoryBot.define do
  factory :comment do
    solution {Faker::Lorem.sentence}
    association :user
    association :problem
    after(:build) do |comment|
      comment.image.attach(io: File.open('public/images/test_img.png'), filename: 'test_img.png')
    end
  end
end