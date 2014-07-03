
FactoryGirl.define do
  factory :seminar, :class => Refinery::Seminars::Seminar do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

