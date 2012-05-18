FactoryGirl.define do
  factory :identity do
    name 'test'
    sequence :email do |n|
        "test+#{n}@gmail.com"
    end
    password 'jjjjjj'
    password_confirmation 'jjjjjj'
  end

  factory :user do
    display_name 'test'
  end

  factory :item do
    sequence (:name){|n| "item-#{n}"}
    unit_cost 10
  end
end
