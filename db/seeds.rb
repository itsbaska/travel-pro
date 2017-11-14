# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Trip.destroy_all
Receipt.destroy_all
Travelgrouping.destroy_all
Outbound.destroy_all
Inbound.destroy_all


User.create(first_name: "Vikky", last_name: "Luc", email: "vikky@gmail.com", phone_number: "847-312-4925", password: "password")

User.create(first_name: "Baska", last_name: "Batbold", email: "bb@gmail.com", phone_number: "847-123-1234", password: "password")

User.create(first_name: "Melissa", last_name: "K", email: "mk@gmail.com", phone_number: "123-456-7891", password: "password")

trip1 = Trip.create(name: "Sister the travelling pants convention", location: "Paris", budget: 538.90, organizer_id: 2, start_date: Date.strptime("11/25/2017", "%m/%d/%Y"), end_date: Date.strptime("11/30/2017", "%m/%d/%Y"))
trip2 = Trip.create(name: "DBC reunion", location: "Bahamas", budget: 78.03, organizer_id: 1, start_date: Date.strptime("11/17/2017", "%m/%d/%Y"), end_date: Date.strptime("11/25/2017", "%m/%d/%Y"))
trip3 = Trip.create(name: "Dodge Ball Wednesday Meet Up", location: "Rocky Mountains", budget: 32.50, organizer_id: 3, start_date: Date.strptime("12/1/2017", "%m/%d/%Y"), end_date: Date.strptime("12/15/2017", "%m/%d/%Y"))

Receipt.create(total: 223.00, store: "Forever21", trip_id: 1, purchaser_id: 1)
Receipt.create(total: 45.32, store: "Target", trip_id: 1, purchaser_id: 2)
Receipt.create(total: 342.00, store: "Dick Sporting Goods", trip_id: 3, purchaser_id: 3)
Receipt.create(total: 123.00, store: "Walmart", trip_id: 2, purchaser_id: 1)


travelg1 = Travelgrouping.create(trip_id: 1, traveller_id: 1)
travelg2 = Travelgrouping.create(trip_id: 1, traveller_id: 3)
travelg3 = Travelgrouping.create(trip_id: 2, traveller_id: 2)
travelg4 = Travelgrouping.create(trip_id: 2, traveller_id: 3)
travelg5 = Travelgrouping.create(trip_id: 3, traveller_id: 1)
travelg6 = Travelgrouping.create(trip_id: 3, traveller_id: 2)


Outbound.create(airline: "Southwest", arrival: DateTime.strptime("11/25/2017 17:00", "%m/%d/%Y %H:%M"), departure: DateTime.strptime("12/5/2017 11:00", "%m/%d/%Y %H:%M"), airport: "Midway", travelgrouping_id: 1)
Outbound.create(airline: "Southwest", arrival: DateTime.strptime("11/17/2017 17:00", "%m/%d/%Y %H:%M"), departure: DateTime.strptime("12/1/2017 11:00", "%m/%d/%Y %H:%M"), airport: "Midway", travelgrouping_id: 3)
Outbound.create(airline: "Southwest", arrival: DateTime.strptime("11/23/2017 12:00", "%m/%d/%Y %H:%M"), departure: DateTime.strptime("12/10/2017 15:00", "%m/%d/%Y %H:%M"), airport: "Midway", travelgrouping_id: 2)
Outbound.create(airline: "Southwest", arrival: DateTime.strptime("11/19/2017 17:00", "%m/%d/%Y %H:%M"), departure: DateTime.strptime("12/12/2017 11:00", "%m/%d/%Y %H:%M"), airport: "Midway", travelgrouping_id: 4)
Outbound.create(airline: "Southwest", arrival: DateTime.strptime("11/19/2017 17:00", "%m/%d/%Y %H:%M"), departure: DateTime.strptime("12/12/2017 11:00", "%m/%d/%Y %H:%M"), airport: "Midway", travelgrouping_id: 5)
Outbound.create(airline: "Southwest", arrival: DateTime.strptime("11/14/2017 17:00", "%m/%d/%Y %H:%M"), departure: DateTime.strptime("12/10/2017 11:00", "%m/%d/%Y %H:%M"), airport: "Midway", travelgrouping_id: 6)

Inbound.create(airline: "Paris Airlines", arrival: DateTime.strptime("11/25/2017 21:00", "%m/%d/%Y %H:%M"), departure: DateTime.strptime("12/5/2017 16:00", "%m/%d/%Y %H:%M"), airport: "Paris airport", travelgrouping_id: 1)

Inbound.create(airline: "Pairs Airlines", arrival: DateTime.strptime("11/23/2017 17:00", "%m/%d/%Y %H:%M"), departure: DateTime.strptime("12/10/2017 21:00", "%m/%d/%Y %H:%M"), airport: "Paris airport", travelgrouping_id: 2)

Inbound.create(airline: "Arizona Airlines", arrival: DateTime.strptime("11/25/2017 23:00", "%m/%d/%Y %H:%M"), departure: DateTime.strptime("12/5/2017 20:00", "%m/%d/%Y %H:%M"), airport: "Arizona  airport", travelgrouping_id: 3)

Inbound.create(airline: "Arizona Airlines", arrival: DateTime.strptime("11/25/2017 20:00", "%m/%d/%Y %H:%M"), departure: DateTime.strptime("12/5/2017 12:00", "%m/%d/%Y %H:%M"), airport: "Arizona  airport", travelgrouping_id: 4)
