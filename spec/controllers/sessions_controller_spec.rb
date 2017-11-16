require 'rails_helper'

describe SessionsController do
	describe "GET #new" do 
		let(:user) { User.create(first_name: "Victoria", last_name: "Luc", phone_number: "847-312-4925", email: "victoriajeniluc@gmail.com", password: "password") }

		it "responds with status code 200" do
			get :new
			expect(response).to have_http_status 200
		end

		it "redirects the user to the login page if not logged in and wants to create a new session" do
			get :new
			expect(response) === (200)
		end 
	end 
end 