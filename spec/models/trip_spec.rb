require 'rails_helper'

describe Trip do
  let(:trip) { Trip.new }

  describe "organizer_person" do
    it "returns the full name of the organizer" do
      user = User.create(first_name: "Victoria", last_name: "Luc", phone_number: "847-312-4925", email: "victoriajeniluc@gmail.com", password: "password")

      trip = Trip.create(name: "Reunion", location: "DBC", budget: 1.30, start_date: Date.strptime("1/17/2018", "%m/%d/%Y"), end_date: Date.strptime("1/22/2018", "%m/%d/%Y"), organizer: user)

      organizer = trip.organizer_person 
      expect(organizer).to eq("Victoria Luc")
    end 
  end

  describe "start_date_format" do
    it "returns the start date formatted" do
      user = User.create(first_name: "Victoria", last_name: "Luc", phone_number: "847-312-4925", email: "victoriajeniluc@gmail.com", password: "password")

      trip = Trip.create(name: "Reunion", location: "DBC", budget: 1.30, start_date: Date.strptime("1/17/2018", "%m/%d/%Y"), end_date: Date.strptime("1/22/2018", "%m/%d/%Y"), organizer: user)

      date = trip.start_date_format
      expect(date).to eq("Wed, Jan. 17, 2018")
    end 
  end

  describe "end_date_format" do
    it "returns the end date formatted" do
      user = User.create(first_name: "Victoria", last_name: "Luc", phone_number: "847-312-4925", email: "victoriajeniluc@gmail.com", password: "password")

      trip = Trip.create(name: "Reunion", location: "DBC", budget: 1.30, start_date: Date.strptime("1/17/2018", "%m/%d/%Y"), end_date: Date.strptime("1/22/2018", "%m/%d/%Y"), organizer: user)

      date = trip.end_date_format
      expect(date).to eq("Mon, Jan. 22, 2018")
    end 
  end

  describe "check_start_date" do 
    it "returns back true if start date was inputted" do 
      user = User.create(first_name: "Victoria", last_name: "Luc", phone_number: "847-312-4925", email: "victoriajeniluc@gmail.com", password: "password")

      trip = Trip.create(name: "Reunion", location: "DBC", budget: 1.30, start_date: Date.strptime("1/17/2018", "%m/%d/%Y"), end_date: Date.strptime("1/22/2018", "%m/%d/%Y"), organizer: user)

      date = trip.check_start_date
      expect(date).to be_truthy 
    end 
  end 

   describe "check_end_date" do 
    it "returns back true if end date was inputted" do 
      user = User.create(first_name: "Victoria", last_name: "Luc", phone_number: "847-312-4925", email: "victoriajeniluc@gmail.com", password: "password")

      trip = Trip.create(name: "Reunion", location: "DBC", budget: 1.30, start_date: Date.strptime("1/17/2018", "%m/%d/%Y"), end_date: Date.strptime("1/22/2018", "%m/%d/%Y"), organizer: user)

      date = trip.check_end_date
      expect(date).to be_truthy 
    end 
  end 

  describe "check_start_date" do 
    it "returns false when there is no start date added" do 
      user = User.create(first_name: "Victoria", last_name: "Luc", phone_number: "847-312-4925", email: "victoriajeniluc@gmail.com", password: "password")

      trip = Trip.create(name: "Reunion", location: "DBC", budget: 1.30, start_date:"", end_date: Date.strptime("1/22/2018", "%m/%d/%Y"), organizer: user)

      date = trip.check_start_date      
      expect(date).to be_falsy
    end 
  end 


  describe "check_end_date" do 
    it "returns false when there is no end date added" do 
      user = User.create(first_name: "Victoria", last_name: "Luc", phone_number: "847-312-4925", email: "victoriajeniluc@gmail.com", password: "password")

      trip = Trip.create(name: "Reunion", location: "DBC", budget: 1.30, start_date: Date.strptime("1/17/2018", "%m/%d/%Y"), end_date:"", organizer: user)

      date = trip.check_end_date      
      expect(date).to be_falsy
    end 
  end 

  describe "receipt_total" do 
    it "returns back zero - since there's no receipt added" do 
      user = User.create(first_name: "Victoria", last_name: "Luc", phone_number: "847-312-4925", email: "victoriajeniluc@gmail.com", password: "password")

      trip = Trip.create(name: "Reunion", location: "DBC", budget: 1.30, start_date: Date.strptime("1/17/2018", "%m/%d/%Y"), end_date:"", organizer: user)

      total = trip.receipt_total
      expect(total).to eq(0)
    end 
  end 


  describe "remainder_amount" do 
    it "returns back the budget amount- since there's no receipt added" do 
      user = User.create(first_name: "Victoria", last_name: "Luc", phone_number: "847-312-4925", email: "victoriajeniluc@gmail.com", password: "password")

      trip = Trip.create(name: "Reunion", location: "DBC", budget: 1.30, start_date: Date.strptime("1/17/2018", "%m/%d/%Y"), end_date:"", organizer: user)

      remainder = trip.remainder_amount
      expect(remainder).to eq(1.3)
    end 
  end 


  describe "receipt_amount_array" do 
    it "returns back an empty array- since there's no receipt added" do 
      user = User.create(first_name: "Victoria", last_name: "Luc", phone_number: "847-312-4925", email: "victoriajeniluc@gmail.com", password: "password")

      trip = Trip.create(name: "Reunion", location: "DBC", budget: 1.30, start_date: Date.strptime("1/17/2018", "%m/%d/%Y"), end_date:"", organizer: user)

      array = trip.receipt_amount_array
      expect(array).to eq([])
    end 
  end 

  describe "purchasers_array" do 
    it "returns back an array of just budget- since there's no receipt added" do 
      user = User.create(first_name: "Victoria", last_name: "Luc", phone_number: "847-312-4925", email: "victoriajeniluc@gmail.com", password: "password")

      trip = Trip.create(name: "Reunion", location: "DBC", budget: 1.30, start_date: Date.strptime("1/17/2018", "%m/%d/%Y"), end_date:"", organizer: user)

      array = trip.purchasers_array
      expect(array).to eq(["budget"])
    end 
  end 

  describe "data_array" do 
    it "returns back an array of the remainder amount in budget- since there's no receipt added" do 
      user = User.create(first_name: "Victoria", last_name: "Luc", phone_number: "847-312-4925", email: "victoriajeniluc@gmail.com", password: "password")

      trip = Trip.create(name: "Reunion", location: "DBC", budget: 1.30, start_date: Date.strptime("1/17/2018", "%m/%d/%Y"), end_date:"", organizer: user)

      array = trip.data_array
      expect(array).to eq([1.3])
    end 
  end 
end 