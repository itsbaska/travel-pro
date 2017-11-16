require 'rails_helper'

describe DashboardsController do
	let(:user) { User.create(first_name: "Victoria", last_name: "Luc", phone_number: "847-312-4925", email: "victoriajeniluc@gmail.com", password: "password")}

	describe "GET #show" do 
		it "responds with status code 200" do
			get :show, params: { id: user.id } 
			expect(response).to have_http_status 302
		end 

		it "assigns the correct user as @user" do
			get :show, params: { id: user.id } 
			expect(assigns(:user)).to eq(user)
		end 


		it "redirects the user to the login page if not logged in and wants to view a dashboard" do
			get :show, params: { id: user.id } 
			expect(response).to redirect_to "/login"
		end 
	end 
end 