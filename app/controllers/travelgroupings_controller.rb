class TravelgroupingsController < ApplicationController

  def new
    authenticate!
    @trip = Trip.find(params[:trip_id])
  end

  def create
    authenticate!
    @trip = Trip.find(params[:trip_id])
    @traveller = User.find_by_email(params[:travellerEmail])
    if @traveller
    	Travelgrouping.create(trip: @trip, traveller: @traveller)
    	InviteMailer.invite_email(@traveller, @trip).deliver
    	redirect_to @trip
    else
    	render component: 'NewTravelgroup', props: { errors: ["Traveller is not found!"], trip: @trip}
    end
  end
end
