require "rails_helper" 

describe "Routing to the receipts", :type => :routing do 

	it "routes GET trip/:trip_id/receipts to receipts#index" do 
		expect(:get => "/trips/1/receipts").to route_to("receipts#index", :trip_id => "1")
	end

	it "routes GET trip/:trip_id/receipts/new to receipts#new" do 
		expect(:get => "/trips/1/receipts/new").to route_to("receipts#new", :trip_id => "1")
	end

	it "routes POST /trips/:trip_id/receipts to receipts#create" do 
		expect(:post => "/trips/1/receipts").to route_to("receipts#create", :trip_id => "1" )
	end
end 