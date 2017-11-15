require 'rails_helper'

describe Receipt do
	describe "validations" do 
		it "is valid with valid attributes" do 
			purchaser = User.create(first_name: "Victoria", last_name: "Luc", phone_number: "847-312-4925", email: "victoriajeniluc@gmail.com", password: "password")

  		trip = Trip.create(name: "Reunion", location: "DBC", budget: 1.30, start_date: Date.strptime("1/17/2018", "%m/%d/%Y"), end_date: Date.strptime("1/22/2018", "%m/%d/%Y"), organizer: purchaser)

			receipt = Receipt.create(store: "Forever21", total: 100, photo: "https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=0ahUKEwj9pcOF38HXAhVEyFQKHUjTAc8QjRwIBw&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FReceipt&psig=AOvVaw1wWRl3Q6EFG_98G0W7lpW2&ust=1510875247017688", trip: trip, purchaser: purchaser)
			expect(receipt).to be_valid 
		end 

		it "is not valid without the store" do 
			purchaser = User.create(first_name: "Victoria", last_name: "Luc", phone_number: "847-312-4925", email: "victoriajeniluc@gmail.com", password: "password")

  		trip = Trip.create(name: "Reunion", location: "DBC", budget: 1.30, start_date: Date.strptime("1/17/2018", "%m/%d/%Y"), end_date: Date.strptime("1/22/2018", "%m/%d/%Y"), organizer: purchaser)

			receipt = Receipt.create(store: "", total: 100, photo: "https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=0ahUKEwj9pcOF38HXAhVEyFQKHUjTAc8QjRwIBw&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FReceipt&psig=AOvVaw1wWRl3Q6EFG_98G0W7lpW2&ust=1510875247017688", trip: trip, purchaser: purchaser)
			expect(receipt).to_not be_valid 
		end 

		it "is not valid without the total" do 
			purchaser = User.create(first_name: "Victoria", last_name: "Luc", phone_number: "847-312-4925", email: "victoriajeniluc@gmail.com", password: "password")

  		trip = Trip.create(name: "Reunion", location: "DBC", budget: 1.30, start_date: Date.strptime("1/17/2018", "%m/%d/%Y"), end_date: Date.strptime("1/22/2018", "%m/%d/%Y"), organizer: purchaser)

			receipt = Receipt.create(store: "Forever21", photo: "https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=0ahUKEwj9pcOF38HXAhVEyFQKHUjTAc8QjRwIBw&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FReceipt&psig=AOvVaw1wWRl3Q6EFG_98G0W7lpW2&ust=1510875247017688", trip: trip, purchaser: purchaser)
			expect(receipt).to_not be_valid 
		end 

		it "is not valid without a purchaser" do
			purchaser = User.create(first_name: "Victoria", last_name: "Luc", phone_number: "847-312-4925", email: "victoriajeniluc@gmail.com", password: "password")
			
			trip = Trip.create(name: "Reunion", location: "DBC", budget: 1.30, start_date: Date.strptime("1/17/2018", "%m/%d/%Y"), end_date: Date.strptime("1/22/2018", "%m/%d/%Y"), organizer: purchaser)


			receipt = Receipt.create(store: "Forever21", total: 100, photo: "https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=0ahUKEwj9pcOF38HXAhVEyFQKHUjTAc8QjRwIBw&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FReceipt&psig=AOvVaw1wWRl3Q6EFG_98G0W7lpW2&ust=1510875247017688", trip: trip)
			expect(receipt).to_not be_valid  
		end 

		it "is not valid without a trip" do 
			purchaser = User.create(first_name: "Victoria", last_name: "Luc", phone_number: "847-312-4925", email: "victoriajeniluc@gmail.com", password: "password")

			receipt = Receipt.create(store: "Forever21", total: 100, photo: "https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=0ahUKEwj9pcOF38HXAhVEyFQKHUjTAc8QjRwIBw&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FReceipt&psig=AOvVaw1wWRl3Q6EFG_98G0W7lpW2&ust=1510875247017688", purchaser: purchaser)
			expect(receipt).to_not be_valid 
		end 
	end 
 
	describe "associations" do 
    it { Receipt.reflect_on_association(:purchaser).macro.should eq(:belongs_to)}

    it { Receipt.reflect_on_association(:trip).macro.should eq(:belongs_to)}
  end 

  describe "receipt_purchaser" do 
  	it "returns back the purchaser's full name" do
  		purchaser = User.create(first_name: "Victoria", last_name: "Luc", phone_number: "847-312-4925", email: "victoriajeniluc@gmail.com", password: "password")

  		trip = Trip.create(name: "Reunion", location: "DBC", budget: 1.30, start_date: Date.strptime("1/17/2018", "%m/%d/%Y"), end_date: Date.strptime("1/22/2018", "%m/%d/%Y"), organizer: purchaser)

  		receipt = Receipt.create(store: "Forever21", total: 100, photo: "https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=0ahUKEwj9pcOF38HXAhVEyFQKHUjTAc8QjRwIBw&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FReceipt&psig=AOvVaw1wWRl3Q6EFG_98G0W7lpW2&ust=1510875247017688", trip: trip, purchaser: purchaser)

  		purchaser_full_name = receipt.receipt_purchaser
  		expect(purchaser_full_name).to eq("Victoria Luc")
  	end 
  end 
end 