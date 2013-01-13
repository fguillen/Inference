FactoryGirl.define do
  factory :widget do
    sequence(:name) { |n| "Widget #{n}" }
    minutes_ago 1440
    script "R script"
  end

  factory :dashboard do
    sequence(:name) { |n| "Dashboard #{n}" }
  end
end