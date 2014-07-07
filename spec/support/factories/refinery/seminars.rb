FactoryGirl.define do
  factory :seminar, :class => Refinery::Seminars::Seminar do
    sequence(:name) { |n| "Seminar#{n}" }
    active true
  end

  factory :seminar_date, :class => Refinery::Seminars::Date do
    sequence(:name) { |n| "SeminarDate#{n}" }
    full false
    date { Date.today }
  end

  factory :seminar_signup, :class => Refinery::Seminars::Signup do
    seminar { FactoryGirl.build(:seminar) }
    date { FactoryGirl.build(:seminar_date, :seminar => seminar) }
    prefix "MyString"
    first_name "Firstname"
    middle_name "Middlename"
    last_name "Lastname"
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
