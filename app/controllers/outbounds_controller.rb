class OutboundsController < ApplicationController

  def index
    authenticate!
    @trip = Trip.find(params[:trip_id])
    @outbound_flights = @trip.outbound_flights
  end

  def new
    authenticate!
    @trip = Trip.find(params[:trip_id])
    @outbound = Outbound.new
  end

  def create
    authenticate!
    @trip = Trip.find(params[:trip_id])
    @travelgroup = Travelgrouping.create(traveller: current_user, trip: @trip)
    @outbound = Outbound.new(flight_params)
    @outbound.travelgrouping = @travelgroup

    if @outbound.save
      redirect_to @trip
    else
      render component: 'NewOutbound', props: {errors: @outbound.errors.full_messages, trip: @trip}
    end
  end

  private
    def flight_params
      params.permit(:airline, :arrival, :departure, :airport)
    end
end
