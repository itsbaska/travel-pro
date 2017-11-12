class TripsController < ApplicationController
  def index
    @user = User.second.first_name
    @trips = Trip.all
  end

  def new
    @trip = Trip.new
  end

  def show
    @trip = Trip.find(params[:id])
    @travellers = @trip.travellers
  end
end
