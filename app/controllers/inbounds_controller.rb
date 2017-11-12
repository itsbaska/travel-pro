class InboundsController < ApplicationController

  def index
    @trip = Trip.find(params[:trip_id])
    @inbound_flight = @trip.inbound_flights
  end

  def new
  	@trip = Trip.find(params[:trip_id])
  	@inbound = Inbound.new
  end

  def create
    authenticate!
    @trip = Trip.find(params[:trip_id])
    @travelgroup = Travelgrouping.create(traveller: current_user, trip: @trip)
    @inbound = Inbound.new(flight_params)
    @inbound.travelgrouping = @travelgroup

    if @inbound.save
      redirect_to @trip
    else
      p @inbound.errors.full_messages
      render component: 'NewInbound', props: {errors: @inbound.errors.full_messages}
    end
  end

  private
    def flight_params
      params.permit(:airline, :arrival, :departure, :airport)
    end
end
