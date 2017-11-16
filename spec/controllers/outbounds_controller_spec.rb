require 'rails_helper'

describe OutboundsController do
	let(:user) { User.create(first_name: "Victoria", last_name: "Luc", phone_number: "847-312-4925", email: "victoriajeniluc@gmail.com", password: "password") }

	let(:trip) { Trip.create(name: "Conversation Partner Convention", location: "Japan", budget: 538.90, organizer: user, start_date: Date.strptime("11/25/2017", "%m/%d/%Y"), end_date: Date.strptime("11/30/2017", "%m/%d/%Y")) }

	describe "GET #index" do 
		it "responds with status code 200" do
			get :index, params: { trip_id: trip.id } 
			expect(response).to have_http_status 302
		end 

		it "redirects the user to the login page if not logged in and wants to view all the outbounds" do
			get :index, params: { trip_id: trip.id } 
			expect(response).to redirect_to("/login")
		end 
	end 

	describe "GET #new" do 
		let(:user) { User.create(first_name: "Victoria", last_name: "Luc", phone_number: "847-312-4925", email: "victoriajeniluc@gmail.com", password: "password") }

		let(:trip) { Trip.create(name: "Conversation Partner Convention", location: "Japan", budget: 538.90, organizer: user, start_date: Date.strptime("11/25/2017", "%m/%d/%Y"), end_date: Date.strptime("11/30/2017", "%m/%d/%Y")) }

		it "responds with status code 200" do
			get :new, params: { trip_id: trip.id }
			expect(response).to have_http_status 302
		end 

		it "assigns a new outbound to @outbound" do 
			get :new, params: { trip_id: trip.id }
			expect(assigns(:outbound)).to be_a_new Outbound
		end 

		it "redirects the user to the login page if not logged in and wants to create a new outbound" do
			get :new, params: { trip_id: trip.id }
			expect(response).to redirect_to("/login")
		end 
	end 
end 