require "rails_helper" 

describe "Routing to the outbounds", :type => :routing do 

	it "routes GET trip/:trip_id/outbounds to outbounds#index" do 
		expect(:get => "/trips/1/outbounds").to route_to("outbounds#index", :trip_id => "1")
	end

	it "routes GET trip/:trip_id/outbounds/new to outbounds#new" do 
		expect(:get => "/trips/1/outbounds/new").to route_to("outbounds#new", :trip_id => "1")
	end

	it "routes POST /trips/:trip_id/outbounds to outbounds#create" do 
		expect(:post => "/trips/1/outbounds").to route_to("outbounds#create", :trip_id => "1" )
	end
end 