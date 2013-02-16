FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "user-#{n}"}
    password "0000"
    email { "#{username}@example.com" }
  end

  factory :farmer do
    sequence(:name) { |n| "farmer-#{n}"}
  end
end