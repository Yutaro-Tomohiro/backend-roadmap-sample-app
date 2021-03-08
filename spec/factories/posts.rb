FactoryBot.define do
  factory :post do
    association :user

    sequence(:title) { |n| "title#{n}" }
    sequence(:article) { |n| "article#{n}" }
  end
end
