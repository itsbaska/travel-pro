FactoryGirl.define do
  factory :trip do
    name { Faker::Address.city }
    location { Faker::Address.country }
    budget { Faker::Commerce.price }
    start_date { Faker::Date.forward(14)}
    end_date { { Faker::Date.forward(20) }
    organizer_id 1
  end
end
