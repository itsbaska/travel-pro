User.destroy_all
Trip.destroy_all
Receipt.destroy_all
Travelgrouping.destroy_all
Outbound.destroy_all
Inbound.destroy_all

User.create(first_name: "Vikky", last_name: "Luc", email: "victoriajeniluc@gmail.com", phone_number: "847-312-4925", password: "password")
User.create(first_name: "Baska", last_name: "Batbold", email: "baskabatboldb@gmail.com", phone_number: "312-998-3506", password: "password")
User.create(first_name: "Melissa", last_name: "Kanhirun", email: "mk7run@gmail.com", phone_number: "847-970-1782", password: "password")
User.create(first_name: "Marla", last_name: "Kallstrom", email: "brandykou@gmail.com", phone_number: "914-482-7293", password: "password")
User.create(first_name: "Austin", last_name: "Ratcliff", email: "austinratcliff@icloud.com", phone_number: "312-569-7223", password: "password")
User.create(first_name: "Sam", last_name: "Tietze", email: "samtietze@gmail.com", phone_number: "651-408-4874", password: "password")
User.create(first_name: "Dan", last_name: "Ioppolo", email: "dan.ioppolo@gmail.com", phone_number: "773-145-2232", password: "password")
User.create(first_name: "Charlie", last_name: "Weber", email: "cweber648@gmail.com", phone_number: "773-231-8736", password: "password")

Trip.create(name: "Travel-pro Vacation", location: "Morocco", budget: 10000.98, organizer_id: 2, start_date: Date.strptime("6/25/2018", "%m/%d/%Y"), end_date: Date.strptime("7/05/2018", "%m/%d/%Y")) #marla
Trip.create(name: "DBC Red Pandas Graduation", location: "West End", budget: 250.03, organizer_id: 5, start_date: Date.strptime("11/17/2017", "%m/%d/%Y"), end_date: Date.strptime("11/18/2017", "%m/%d/%Y")) #austin
Trip.create(name: "Kickball Wednesday Comeback", location: "Chicago", budget: 100.75, organizer_id: 6, start_date: Date.strptime("5/9/2018", "%m/%d/%Y"), end_date: Date.strptime("5/10/2018", "%m/%d/%Y")) #sam
Trip.create(name: "DBC Reunion", location: "Not Dougan's", budget: 300.58, organizer_id: 6, start_date: Date.strptime("12/7/2019", "%m/%d/%Y"), end_date: Date.strptime("12/18/2019", "%m/%d/%Y"))

Travelgrouping.create(trip_id: 1, traveller_id: 1)
Travelgrouping.create(trip_id: 1, traveller_id: 2)
Travelgrouping.create(trip_id: 1, traveller_id: 3)
Travelgrouping.create(trip_id: 2, traveller_id: 1)
Travelgrouping.create(trip_id: 2, traveller_id: 2)
Travelgrouping.create(trip_id: 2, traveller_id: 3)
Travelgrouping.create(trip_id: 2, traveller_id: 4)
Travelgrouping.create(trip_id: 2, traveller_id: 5)
Travelgrouping.create(trip_id: 2, traveller_id: 6)
Travelgrouping.create(trip_id: 2, traveller_id: 7)
Travelgrouping.create(trip_id: 2, traveller_id: 8)
Travelgrouping.create(trip_id: 3, traveller_id: 1)
Travelgrouping.create(trip_id: 3, traveller_id: 2)
Travelgrouping.create(trip_id: 3, traveller_id: 3)
Travelgrouping.create(trip_id: 3, traveller_id: 6)
Travelgrouping.create(trip_id: 3, traveller_id: 8)
Travelgrouping.create(trip_id: 5, traveller_id: 1)
Travelgrouping.create(trip_id: 5, traveller_id: 2)
Travelgrouping.create(trip_id: 5, traveller_id: 3)
Travelgrouping.create(trip_id: 5, traveller_id: 4)
Travelgrouping.create(trip_id: 5, traveller_id: 5)
Travelgrouping.create(trip_id: 5, traveller_id: 6)
Travelgrouping.create(trip_id: 5, traveller_id: 7)
Travelgrouping.create(trip_id: 5, traveller_id: 8)

## VIKKY
Outbound.create(airline: "Air France", arrival: DateTime.strptime("06/25/2017 19:45", "%m/%d/%Y %H:%M"), departure: DateTime.strptime("06/25/2017 11:05", "%m/%d/%Y %H:%M"), airport: "O'Hare (ORD)", travelgrouping_id: 1)
Outbound.create(airline: "Air France", arrival: DateTime.strptime("06/26/2017 9:55", "%m/%d/%Y %H:%M"), departure: DateTime.strptime("06/26/2017 12:15", "%m/%d/%Y %H:%M"), airport: "Charles de Gaulle (CDG)", travelgrouping_id: 1)
Inbound.create(airline: "Transavia-Delta", arrival: DateTime.strptime("07/05/2017 09:35", "%m/%d/%Y %H:%M"), departure: DateTime.strptime("07/05/2017 14:35", "%m/%d/%Y %H:%M"), airport: "Marrakesh Menara Airport (RAK)", travelgrouping_id: 1)
Inbound.create(airline: "Royal Dutch Airline KLM", arrival: DateTime.strptime("07/05/2017 12:25", "%m/%d/%Y %H:%M"), departure: DateTime.strptime("07/05/2017 13:55", "%m/%d/%Y %H:%M"), airport: "Amsterdam Airport Schiphol (AMS)", travelgrouping_id: 1)

 ## BASKA
Outbound.create(airline: "Delta", arrival: DateTime.strptime("06/25/2017 9:00", "%m/%d/%Y %H:%M"), departure: DateTime.strptime("06/25/2017 12:18", "%m/%d/%Y %H:%M"), airport: "O'Hare (ORD)", travelgrouping_id: 2)
Outbound.create(airline: "Air France", arrival: DateTime.strptime("06/25/2017 16:20", "%m/%d/%Y %H:%M"), departure: DateTime.strptime("06/25/2017 5:45", "%m/%d/%Y %H:%M"), airport: "John F. Kennedy Airport (JFK)", travelgrouping_id: 2)
Outbound.create(airline: "Air France", arrival: DateTime.strptime("06/26/2017 6:50", "%m/%d/%Y %H:%M"), departure: DateTime.strptime("06/26/2017 9:10", "%m/%d/%Y %H:%M"), airport: "Charles de Gaulle (CDG)", travelgrouping_id: 2)
Inbound.create(airline: "Transavia-Delta", arrival: DateTime.strptime("07/05/2017 09:35", "%m/%d/%Y %H:%M"), departure: DateTime.strptime("07/05/2017 14:35", "%m/%d/%Y %H:%M"), airport: "Marrakesh Menara Airport (RAK)", travelgrouping_id: 2)
Inbound.create(airline: "Royal Dutch Airline KLM", arrival: DateTime.strptime("07/05/2017 12:25", "%m/%d/%Y %H:%M"), departure: DateTime.strptime("07/05/2017 13:55", "%m/%d/%Y %H:%M"), airport: "Amsterdam Airport Schiphol (AMS)", travelgrouping_id: 2)


## MELISSA
Outbound.create(airline: "Delta", arrival: DateTime.strptime("06/25/2017 9:18", "%m/%d/%Y %H:%M"), departure: DateTime.strptime("06/25/2017 11:05", "%m/%d/%Y %H:%M"), airport: "O'Hare (ORD)", travelgrouping_id: 3)
Outbound.create(airline: "Delta", arrival: DateTime.strptime("06/26/2017 12:05", "%m/%d/%Y %H:%M"), departure: DateTime.strptime("06/26/2017 5:15", "%m/%d/%Y %H:%M"), airport: "Logan International(BOS)", travelgrouping_id: 3)
Inbound.create(airline: "Transavia-Delta", arrival: DateTime.strptime("07/05/2017 09:35", "%m/%d/%Y %H:%M"), departure: DateTime.strptime("07/05/2017 14:35", "%m/%d/%Y %H:%M"), airport: "Marrakesh Menara Airport (RAK)", travelgrouping_id: 3)
Inbound.create(airline: "Royal Dutch Airline KLM", arrival: DateTime.strptime("07/05/2017 12:25", "%m/%d/%Y %H:%M"), departure: DateTime.strptime("07/05/2017 13:55", "%m/%d/%Y %H:%M"), airport: "Amsterdam Airport Schiphol (AMS)", travelgrouping_id: 3)
