require "rails_helper" 

describe "Routing to the travelgroupings", :type => :routing do 
	it "routes GET trip/:trip_id/travelgroupings/new to travelgroupings#new" do 
		expect(:get => "/trips/1/travelgroupings/new").to route_to("travelgroupings#new", :trip_id => "1")
	end

	it "routes POST /trips/:trip_id/travelgroupings to trips#create" do 
		expect(:post => "/trips/1/travelgroupings").to route_to("travelgroupings#create", :trip_id => "1" )
	end
end 