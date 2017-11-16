require "rails_helper" 

describe "Routing to the trips", :type => :routing do 
	it "routes GET /trips/new to trips#new" do 
		expect(:get => "/trips/new").to route_to("trips#new")
	end

	it "routes POST /trips to trips#create" do 
		expect(:post => "/trips").to route_to("trips#create")
	end

	it "routes GET /trips/:id to trips#show" do 
		expect(:get => "/trips/1").to route_to("trips#show", :id => "1")
	end
end 