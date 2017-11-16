require "rails_helper" 

describe "Routing to the signup", :type => :routing do 
	it "routes GET /users/sign_up to users#new" do 
		expect(:get => "/users/sign_up").to route_to("users#new")
	end

	it "routes POST /users to users#create" do 
		expect(:post => "/users").to route_to("users#create")
	end

	it "routes GET /users/:id to users#show" do 
		expect(:get => "/users/1").to route_to("users#show", :id => "1")
	end
end 