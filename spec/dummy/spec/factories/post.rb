FactoryBot.define do
  factory :post do
    title        { Post::TITLE_ATTR.sample }
    body         { Faker::Lorem.sentence }
    publiched_at {  2.days.ago }
    important    { [true, false].sample }
    likes_count  { rand(10..100) }
  end
end
