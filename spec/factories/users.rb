FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "username#{n}" }
  end
end
