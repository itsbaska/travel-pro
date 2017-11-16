require "rails_helper" 

describe "Routing to the inbounds", :type => :routing do 

	it "routes GET trip/:trip_id/inbounds to inbounds#index" do 
		expect(:get => "/trips/1/inbounds").to route_to("inbounds#index", :trip_id => "1")
	end

	it "routes GET trip/:trip_id/inbounds/new to inbounds#new" do 
		expect(:get => "/trips/1/inbounds/new").to route_to("inbounds#new", :trip_id => "1")
	end

	it "routes POST /trips/:trip_id/inbounds to inbounds#create" do 
		expect(:post => "/trips/1/inbounds").to route_to("inbounds#create", :trip_id => "1" )
	end
end 