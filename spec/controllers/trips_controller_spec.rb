require 'rails_helper'

describe TripsController do
	describe "GET #new" do 
		it "responds with status code 200" do
			get :new
			expect(response).to have_http_status 302
		end 

		it "assigns a new trip to @trip" do 
			get :new
			expect(assigns(:trip)).to be_a_new Trip
		end 

		it "redirects the user to the login page if not logged in and wants to create a new trip" do
			get :new
			expect(response).to redirect_to("/login")
		end 
	end 

	describe "GET #show" do 
		let(:user) { User.create(first_name: "Victoria", last_name: "Luc", phone_number: "847-312-4925", email: "victoriajeniluc@gmail.com", password: "password") }
		let(:trip) { Trip.create(name: "Conversation Partner Convention", location: "Japan", budget: 538.90, organizer: user, start_date: Date.strptime("11/25/2017", "%m/%d/%Y"), end_date: Date.strptime("11/30/2017", "%m/%d/%Y")) }

		it "responds with status code 200" do
			get :show, params: { id: trip.id } 
			expect(response).to have_http_status 302
		end 

		it "assigns the correct trip as @trip" do
			get :show, params: { id: trip.id } 
			expect(assigns(:trip)).to eq(trip)
		end 


		it "redirects the user to the login page if not logged in and wants to view a trip" do
			get :show, params: { id: trip.id } 
			expect(response).to redirect_to "/login"
		end 
	end 
end 