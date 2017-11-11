class OutboundsController < ApplicationController
  def new 
  	@trip = Trip.find(params[:trip_id])
  	@outbound = Outbound.new 
  end
end
