require 'rails_helper'

describe Inbound do
  let(:inbound) { Inbound.new }

  describe "traveller_named" do
    it "returns the full name of the traveller" do
      user = User.create(first_name: "Victoria", last_name: "Luc", phone_number: "847-312-4925", email: "victoriajeniluc@gmail.com", password: "password")

      trip = Trip.create(name: "Reunion", location: "DBC", budget: 1.30, start_date: Date.strptime("1/17/2018", "%m/%d/%Y"), end_date: Date.strptime("1/22/2018", "%m/%d/%Y"), organizer: user)

      tripgroup = Travelgrouping.create(trip: trip, traveller: user)  
      inbound = Inbound.create(airline: "Southwest", airport: "Midway", arrival: DateTime.strptime("11/17/2017 17:00", "%m/%d/%Y %H:%M"), departure: DateTime.strptime("12/1/2017 11:00", "%m/%d/%Y %H:%M"), travelgrouping: tripgroup)

      traveller = inbound.traveller_named 
      expect(traveller).to eq("Victoria Luc")
    end 
  end

  describe "date_format_arrival" do 
    it "returns back the date to be formatted" do 
      user = User.create(first_name: "Victoria", last_name: "Luc", phone_number: "847-312-4925", email: "victoriajeniluc@gmail.com", password: "password")

      trip = Trip.create(name: "Reunion", location: "DBC", budget: 1.30, start_date: Date.strptime("1/17/2018", "%m/%d/%Y"), end_date: Date.strptime("1/22/2018", "%m/%d/%Y"), organizer: user)

      tripgroup = Travelgrouping.create(trip: trip, traveller: user)  
      inbound = Inbound.create(airline: "Southwest", airport: "Midway", arrival: DateTime.strptime("11/17/2017 17:00", "%m/%d/%Y %H:%M"), departure: DateTime.strptime("12/1/2017 11:00", "%m/%d/%Y %H:%M"), travelgrouping: tripgroup)

      arrival_format_date = inbound.date_format_arrival
      expect(arrival_format_date).to eq("Fri, Nov. 17, 2017 17:00") 
    end 
  end 

  describe "date_format_departure" do 
    it "returns back the date to be formatted" do 
      user = User.create(first_name: "Victoria", last_name: "Luc", phone_number: "847-312-4925", email: "victoriajeniluc@gmail.com", password: "password")

      trip = Trip.create(name: "Reunion", location: "DBC", budget: 1.30, start_date: Date.strptime("1/17/2018", "%m/%d/%Y"), end_date: Date.strptime("1/22/2018", "%m/%d/%Y"), organizer: user)

      tripgroup = Travelgrouping.create(trip: trip, traveller: user)  
      inbound = Inbound.create(airline: "Southwest", airport: "Midway", arrival: DateTime.strptime("11/17/2017 17:00", "%m/%d/%Y %H:%M"), departure: DateTime.strptime("12/1/2017 11:00", "%m/%d/%Y %H:%M"), travelgrouping: tripgroup)

      departure_format_date = inbound.date_format_departure
      expect(departure_format_date).to eq("Fri, Dec. 01, 2017 11:00") 
    end 
  end 

  describe "check_arrival" do 
    it "returns back true if arrival date was inputted" do 
      user = User.create(first_name: "Victoria", last_name: "Luc", phone_number: "847-312-4925", email: "victoriajeniluc@gmail.com", password: "password")

      trip = Trip.create(name: "Reunion", location: "DBC", budget: 1.30, start_date: Date.strptime("1/17/2018", "%m/%d/%Y"), end_date: Date.strptime("1/22/2018", "%m/%d/%Y"), organizer: user)

      tripgroup = Travelgrouping.create(trip: trip, traveller: user)  
      inbound = Inbound.create(airline: "Southwest", airport: "Midway", arrival: DateTime.strptime("11/17/2017 17:00", "%m/%d/%Y %H:%M"), departure: DateTime.strptime("12/1/2017 11:00", "%m/%d/%Y %H:%M"), travelgrouping: tripgroup)

      arrival = inbound.check_arrival
      expect(arrival).to be_truthy 
    end 
  end 

  describe "check_departure" do 
    it "returns back true if the departure date was inputted" do 
      user = User.create(first_name: "Victoria", last_name: "Luc", phone_number: "847-312-4925", email: "victoriajeniluc@gmail.com", password: "password")

      trip = Trip.create(name: "Reunion", location: "DBC", budget: 1.30, start_date: Date.strptime("1/17/2018", "%m/%d/%Y"), end_date: Date.strptime("1/22/2018", "%m/%d/%Y"), organizer: user)

      tripgroup = Travelgrouping.create(trip: trip, traveller: user)  
      inbound = Inbound.create(airline: "Southwest", airport: "Midway", arrival: DateTime.strptime("11/17/2017 17:00", "%m/%d/%Y %H:%M"), departure: DateTime.strptime("12/1/2017 11:00", "%m/%d/%Y %H:%M"), travelgrouping: tripgroup)

      departure = inbound.check_departure
      expect(departure).to be_truthy 
    end 
  end 

  describe "check_departure" do 
    it "returns false when there is no departure date added" do 
      user = User.create(first_name: "Victoria", last_name: "Luc", phone_number: "847-312-4925", email: "victoriajeniluc@gmail.com", password: "password")

      trip = Trip.create(name: "Reunion", location: "DBC", budget: 1.30, start_date: Date.strptime("1/17/2018", "%m/%d/%Y"), end_date: Date.strptime("1/22/2018", "%m/%d/%Y"), organizer: user)

      tripgroup = Travelgrouping.create(trip: trip, traveller: user)  

      inbound = Inbound.create(airline: "Southwest", airport: "Midway", arrival: DateTime.strptime("11/17/2017 17:00", "%m/%d/%Y %H:%M"), departure:"", travelgrouping: tripgroup)

      departure = inbound.check_departure
      expect(departure).to be_falsy
    end 
  end 

  describe "check_arrival" do 
    it "returns back false if arrival date wasn't inputted" do 
      user = User.create(first_name: "Victoria", last_name: "Luc", phone_number: "847-312-4925", email: "victoriajeniluc@gmail.com", password: "password")

      trip = Trip.create(name: "Reunion", location: "DBC", budget: 1.30, start_date: Date.strptime("1/17/2018", "%m/%d/%Y"), end_date: Date.strptime("1/22/2018", "%m/%d/%Y"), organizer: user)

      tripgroup = Travelgrouping.create(trip: trip, traveller: user)  
      inbound = Inbound.create(airline: "Southwest", airport: "Midway", arrival:"", departure: DateTime.strptime("12/1/2017 11:00", "%m/%d/%Y %H:%M"), travelgrouping: tripgroup)

      arrival = inbound.check_arrival
      expect(arrival).to be_falsy
    end 
  end 

  describe "check_arrival" do 
    it "returns back false if arrival date was in the past" do 
      user = User.create(first_name: "Victoria", last_name: "Luc", phone_number: "847-312-4925", email: "victoriajeniluc@gmail.com", password: "password")

      trip = Trip.create(name: "Reunion", location: "DBC", budget: 1.30, start_date: Date.strptime("1/17/2018", "%m/%d/%Y"), end_date: Date.strptime("1/22/2018", "%m/%d/%Y"), organizer: user)

      tripgroup = Travelgrouping.create(trip: trip, traveller: user)  
      inbound = Inbound.create(airline: "Southwest", airport: "Midway", arrival:DateTime.strptime("11/02/2017 17:00", "%m/%d/%Y %H:%M"), departure: DateTime.strptime("12/1/2017 11:00", "%m/%d/%Y %H:%M"), travelgrouping: tripgroup)

      arrival = inbound.check_arrival
      expect(arrival.uniq).to eq(["must not be in the past"])
    end 
  end 


  describe "check_departure" do 
    it "returns back false if departure date was in the past" do 
      user = User.create(first_name: "Victoria", last_name: "Luc", phone_number: "847-312-4925", email: "victoriajeniluc@gmail.com", password: "password")

      trip = Trip.create(name: "Reunion", location: "DBC", budget: 1.30, start_date: Date.strptime("1/17/2018", "%m/%d/%Y"), end_date: Date.strptime("1/22/2018", "%m/%d/%Y"), organizer: user)

      tripgroup = Travelgrouping.create(trip: trip, traveller: user)  
      inbound = Inbound.create(airline: "Southwest", airport: "Midway", arrival:DateTime.strptime("11/17/2017 17:00", "%m/%d/%Y %H:%M"), departure: DateTime.strptime("11/1/2017 11:00", "%m/%d/%Y %H:%M"), travelgrouping: tripgroup)

      departure = inbound.check_departure
      expect(departure.uniq).to eq(["must not be in the past"])
    end 
  end 

  describe "associations" do 
    it { Inbound.reflect_on_association(:travelgrouping).macro.should eq(:belongs_to)}

    it { Inbound.reflect_on_association(:traveller).macro.should eq(:has_one)}
  end 

  describe "validations" do 
    it "is valid with all the valid attributes" do 
      user = User.create(first_name: "Victoria", last_name: "Luc", phone_number: "847-312-4925", email: "victoriajeniluc@gmail.com", password: "password")

      trip = Trip.create(name: "Reunion", location: "DBC", budget: 1.30, start_date: Date.strptime("1/17/2018", "%m/%d/%Y"), end_date: Date.strptime("1/22/2018", "%m/%d/%Y"), organizer: user)

      tripgroup = Travelgrouping.create(trip: trip, traveller: user)  

      inbound = Inbound.create(airline: "Southwest", airport: "Midway", arrival: DateTime.strptime("11/17/2017 17:00", "%m/%d/%Y %H:%M"), arrival_formatted: "Fri, Nov. 17, 2017 17:00", departure: DateTime.strptime("11/18/2017 11:00", "%m/%d/%Y %H:%M"), departure_formatted: "Sat, Nov. 18, 2017 11:00", travelgrouping: tripgroup, traveller: user)

      expect(inbound).to be_valid 
    end

    it "is not valid without an airline" do 
      user = User.create(first_name: "Victoria", last_name: "Luc", phone_number: "847-312-4925", email: "victoriajeniluc@gmail.com", password: "password")

      trip = Trip.create(name: "Reunion", location: "DBC", budget: 1.30, start_date: Date.strptime("1/17/2018", "%m/%d/%Y"), end_date: Date.strptime("1/22/2018", "%m/%d/%Y"), organizer: user)

      tripgroup = Travelgrouping.create(trip: trip, traveller: user)  
      inbound = Inbound.create(airport: "Midway", arrival:DateTime.strptime("11/17/2017 17:00", "%m/%d/%Y %H:%M"), departure: DateTime.strptime("11/1/2017 11:00", "%m/%d/%Y %H:%M"), travelgrouping: tripgroup)
      expect(inbound).to_not be_valid 
    end

    it "is not valid without an airport" do 
      user = User.create(first_name: "Victoria", last_name: "Luc", phone_number: "847-312-4925", email: "victoriajeniluc@gmail.com", password: "password")

      trip = Trip.create(name: "Reunion", location: "DBC", budget: 1.30, start_date: Date.strptime("1/17/2018", "%m/%d/%Y"), end_date: Date.strptime("1/22/2018", "%m/%d/%Y"), organizer: user)

      tripgroup = Travelgrouping.create(trip: trip, traveller: user)  
      inbound = Inbound.create(airline: "Southwest", arrival:DateTime.strptime("11/17/2017 17:00", "%m/%d/%Y %H:%M"), departure: DateTime.strptime("11/1/2017 11:00", "%m/%d/%Y %H:%M"), travelgrouping: tripgroup)
      expect(inbound).to_not be_valid 
    end 

    it "is not valid without an arrival date" do 
      user = User.create(first_name: "Victoria", last_name: "Luc", phone_number: "847-312-4925", email: "victoriajeniluc@gmail.com", password: "password")

      trip = Trip.create(name: "Reunion", location: "DBC", budget: 1.30, start_date: Date.strptime("1/17/2018", "%m/%d/%Y"), end_date: Date.strptime("1/22/2018", "%m/%d/%Y"), organizer: user)

      tripgroup = Travelgrouping.create(trip: trip, traveller: user)  
      inbound = Inbound.create(airline: "Southwest", airport: "Midway", departure: DateTime.strptime("11/1/2017 11:00", "%m/%d/%Y %H:%M"), travelgrouping: tripgroup)
      expect(inbound).to_not be_valid 
    end 

    it "is not valid without a departure" do 
      user = User.create(first_name: "Victoria", last_name: "Luc", phone_number: "847-312-4925", email: "victoriajeniluc@gmail.com", password: "password")

      trip = Trip.create(name: "Reunion", location: "DBC", budget: 1.30, start_date: Date.strptime("1/17/2018", "%m/%d/%Y"), end_date: Date.strptime("1/22/2018", "%m/%d/%Y"), organizer: user)

      tripgroup = Travelgrouping.create(trip: trip, traveller: user)  
      inbound = Inbound.create(airline: "Southwest", airport: "Midway", arrival:DateTime.strptime("11/17/2017 17:00", "%m/%d/%Y %H:%M"), travelgrouping: tripgroup)
      expect(inbound).to_not be_valid 
    end   

    it "is not valid without a travel group" do 
      user = User.create(first_name: "Victoria", last_name: "Luc", phone_number: "847-312-4925", email: "victoriajeniluc@gmail.com", password: "password")

      trip = Trip.create(name: "Reunion", location: "DBC", budget: 1.30, start_date: Date.strptime("1/17/2018", "%m/%d/%Y"), end_date: Date.strptime("1/22/2018", "%m/%d/%Y"), organizer: user)

      tripgroup = Travelgrouping.create(trip: trip, traveller: user)  
      inbound = Inbound.create(airline: "Southwest", airport: "Midway", arrival:DateTime.strptime("11/17/2017 17:00", "%m/%d/%Y %H:%M"), departure: DateTime.strptime("11/1/2017 11:00", "%m/%d/%Y %H:%M"))
      expect(inbound).to_not be_valid 
    end 
  end 
end