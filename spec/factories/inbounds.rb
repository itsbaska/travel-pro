FactoryGirl.define do
  factory :inbound do
    airline { Faker::Company.name }
    arrival DateTime.strptime("11/17/2017 17:00", "%m/%d/%Y %H:%M")
    departure DateTime.strptime("11/17/2017 17:00", "%m/%d/%Y %H:%M")
    airport { Faker::Address.city}
    travelgrouping_id 1
  end
end
