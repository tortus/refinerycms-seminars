FactoryGirl.define do
  factory :seminar, :class => Refinery::Seminars::Seminar do
    sequence(:name) { |n| "seminar #{n}" }
  end

  factory :date, :class => Refinery::Seminars::Date do
    sequence(:name) { |n| "date #{n}" }
    date { Date.today }
  end
end

