class InboundsController < ApplicationController
  def new 
  	@trip = Trip.find(params[:trip_id])
  	@inbound = Inbound.new 
  end
end
