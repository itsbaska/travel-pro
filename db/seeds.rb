User.destroy_all
Trip.destroy_all
Receipt.destroy_all
Travelgrouping.destroy_all
Outbound.destroy_all
Inbound.destroy_all

User.create(first_name: "Vikky", last_name: "Luc", email: "vikky@gmail.com", phone_number: "847-312-4925", password: "password")
User.create(first_name: "Baska", last_name: "Batbold", email: "bb@gmail.com", phone_number: "847-123-1234", password: "password")
User.create(first_name: "Melissa", last_name: "Kanhirun", email: "mk7run@gmail.com", phone_number: "847-970-1782", password: "password")
User.create(first_name: "Marla", last_name: "Kallstrom", email: "mk-j@gmail.com", phone_number: "571-416-7561", password: "password")
User.create(first_name: "Austy", last_name: "Ratcliff", email: "austin@gmail.com", phone_number: "312-569-7223", password: "password")
User.create(first_name: "Sam", last_name: "Tietze", email: "samtietze@gmail.com", phone_number: "312-476-0921", password: "password")
User.create(first_name: "Dan", last_name: "Ioppolo", email: "dan.ioppolo@gmail.com", phone_number: "773-145-2232", password: "password")
User.create(first_name: "Charlie", last_name: "Weber", email: "cweber648@gmail.com", phone_number: "773-231-8736", password: "password")
User.create(first_name: "George", last_name: "Barefoot", email: "barefoot.george8@gmail.com", phone_number: "773-857-3416", password: "password")

Trip.create(name: "Conversation Partner Convention", location: "Japan", budget: 538.90, organizer_id: 4, start_date: Date.strptime("11/25/2017", "%m/%d/%Y"), end_date: Date.strptime("11/30/2017", "%m/%d/%Y")) #marla
Trip.create(name: "Squad Goals Meetup", location: "Alabama", budget: 78.03, organizer_id: 5, start_date: Date.strptime("11/17/2017", "%m/%d/%Y"), end_date: Date.strptime("11/25/2017", "%m/%d/%Y")) #austin
Trip.create(name: "Kickball Wednesday", location: "Rocky Mountains", budget: 32.50, organizer_id: 6, start_date: Date.strptime("12/1/2017", "%m/%d/%Y"), end_date: Date.strptime("12/15/2017", "%m/%d/%Y")) #sam
Trip.create(name: "Chartable Council", location: "DC", budget: 3322.50, organizer_id: 7, start_date: Date.strptime("12/10/2017", "%m/%d/%Y"), end_date: Date.strptime("12/17/2017", "%m/%d/%Y")) #dan
Trip.create(name: "Slow Your Scroll Clambake", location: "Florida", budget: 200.00, organizer_id: 8, start_date: Date.strptime("1/10/2018", "%m/%d/%Y"), end_date: Date.strptime("1/17/2018", "%m/%d/%Y")) #charlie
Trip.create(name: "Battlecats Powwow", location: "Catlandia", budget: 0.25, organizer_id: 6, start_date: Date.strptime("1/17/2018", "%m/%d/%Y"), end_date: Date.strptime("1/22/2018", "%m/%d/%Y")) #sam
Trip.create(name: "DBC Reunion", location: "Not Dougans", budget: 300.00, organizer_id: 9, start_date: Date.strptime("11/17/2019", "%m/%d/%Y"), end_date: Date.strptime("11/18/2019", "%m/%d/%Y"))

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

Inbound.create(airline: "Nippon Airlines", arrival: DateTime.strptime("11/25/2017 21:00", "%m/%d/%Y %H:%M"), departure: DateTime.strptime("12/5/2017 16:00", "%m/%d/%Y %H:%M"), airport: "Nippon airport", travelgrouping_id: 1)

Inbound.create(airline: "Taco Airlines", arrival: DateTime.strptime("11/23/2017 17:00", "%m/%d/%Y %H:%M"), departure: DateTime.strptime("12/10/2017 21:00", "%m/%d/%Y %H:%M"), airport: "O'Hare Airport", travelgrouping_id: 2)

Inbound.create(airline: "Arizona Airlines", arrival: DateTime.strptime("11/25/2017 23:00", "%m/%d/%Y %H:%M"), departure: DateTime.strptime("12/5/2017 20:00", "%m/%d/%Y %H:%M"), airport: "Arizona  airport", travelgrouping_id: 3)

Inbound.create(airline: "Arizona Airlines", arrival: DateTime.strptime("11/25/2017 20:00", "%m/%d/%Y %H:%M"), departure: DateTime.strptime("12/5/2017 12:00", "%m/%d/%Y %H:%M"), airport: "Arizona  airport", travelgrouping_id: 4)
