require "rails_helper" 

describe "Routing to the login", :type => :routing do 
	it "routes GET /login to sessions#new" do 
		expect(:get => "/login").to route_to("sessions#new")
	end

	it "routes POST /sessions to sessions#create" do 
		expect(:post => "/sessions").to route_to("sessions#create")
	end

	it "routes DELETE /logout to sessions#destroy" do
		expect(:delete => "/logout").to route_to("sessions#destroy")
	end

	it "routes GET /users/:id/dashboards to dashboards#show" do 
		expect(:get => "/users/1/dashboards").to route_to("dashboards#show", :id => "1")
	end 
end 