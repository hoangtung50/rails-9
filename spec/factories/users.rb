FactoryGirl.define do
  factory :user do
    sequence(:email)      { |n| "user-#{n}@example.com" }
    password              '123123123'
  end
end