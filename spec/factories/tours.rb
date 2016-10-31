FactoryGirl.define do
  factory :tour do
    name { Faker::Name.name }
    schedule "Da Nang - Hoi An"
    place_departure { Faker::Address.city }
    time "2 ngay 1 dem"
    people_number "2"
    transport "Xe may"
    price "10"
    content { Faker::Lorem.paragraph }
    time_start "01-01-2016"
  end
end
