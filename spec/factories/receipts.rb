FactoryGirl.define do
  factory :receipt do
    total { Faker::Commerce.price }
    store { Faker::Commerce.department }
    trip_id { Faker::Number.between(1, 10) }
    purchaser_id { Faker::Number.between(1, 10) }
    purchaser_name { Faker::Name.name }
    photo 'http://lorempixel.com/400/200'
  end
end
