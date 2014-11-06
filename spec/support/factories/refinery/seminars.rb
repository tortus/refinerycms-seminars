FactoryGirl.define do
  factory :seminar, :class => Refinery::Seminars::Seminar do
    sequence(:name) { |n| "Seminar#{n}" }
    active true

    trait :active do
      active true
    end

    trait :with_active_date do
      after(:create) do |seminar|
        seminar.dates << FactoryGirl.create(:seminar_date, :active)
      end
    end
  end

  factory :seminar_date, :class => Refinery::Seminars::Date do
    sequence(:name) { |n| "SeminarDate#{n}" }
    full false
    date { Date.today }

    trait :active do
      full false
      date { Date.today }
    end

    trait :full do
      full true
    end
  end

  factory :seminar_signup, :class => Refinery::Seminars::Signup do
    seminar { FactoryGirl.build(:seminar) }
    date { FactoryGirl.build(:seminar_date, :seminar => seminar) }
    prefix "MyString"
    first_name "Firstname"
    middle_name "Middlename"
    sequence(:last_name) {|n| "Lastname #{n}"}
    suffix "MyString"
    address1 "MyString"
    address2 "MyString"
    city "MyString"
    state "MyString"
    zipcode "MyString"
    day_phone "MyString"
    home_phone "MyString"
    email "test@test.com"
    member_number "MyString"
    number_attending 1
    guest_name "MyString"
    guest_phone "MyString"
    guest_email "MyString"
    reminder "Email"
    comments "MyText"
    spam false
  end
end
