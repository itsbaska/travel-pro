class TripsController < ApplicationController
  def index
    @user = User.second.first_name
    @trips = Trip.all
  end

  def new
  	@trip = Trip.new  
  end 
end
