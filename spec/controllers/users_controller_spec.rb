require 'rails_helper'

describe UsersController do
	describe "GET #new" do 
		it "responds with status code 200" do
			get :new
			expect(response).to have_http_status 200
		end 

		it "assigns a new user to @user" do 
			get :new
			expect(assigns(:user)).to be_a_new User
		end 

		it "redirects the user to the login page if not logged in and wants to create a new trip" do
			get :new
			expect(response) === 200
		end 
	end 
end 