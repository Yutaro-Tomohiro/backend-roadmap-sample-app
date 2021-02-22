FactoryBot.define do
  factory :post do
    association :user

    sequence(:title) { |n| "title#{n}" }
    sequence(:text) { |n| "text#{n}" }
  end
end
