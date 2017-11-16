require "rails_helper" 

describe "Routing to the application", :type => :routing do 
	it "routes GET / to trips#index" do 
		expect(:get => "/").to route_to("trips#index")
	end
end 