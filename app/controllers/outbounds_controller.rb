class OutboundsController < ApplicationController
  def new
    return authenticate!
    @trip = Trip.find(params[:trip_id])
    @outbound = Outbound.new
  end

  def create
    return authenticate!
    @trip = Trip.find(params[:trip_id])
    @travelgroup = Travelgrouping.new(traveller: current_user, trip: @trip)
    @outbound = Outbound.new(flight_params)
    @outbound.travelgrouping = @travelgroup

    if @outbound.save
      redirect_to @trip
    else
      render component: 'NewOutbound', props: {errors: @outbound.errors.full_messages}
    end
  end

  private
    def flight_params
      params.permit(:airline, :arrival, :departure, :airport)
    end
end
