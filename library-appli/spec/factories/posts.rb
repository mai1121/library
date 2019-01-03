FactoryBot.define do
  factory :post do
    quote     "aaaa"
    author    "村上春樹"
    title     "海辺のカフカ"
    user_id 1
    created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
  end
end
