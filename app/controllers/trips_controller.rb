class TripsController < ApplicationController
  def index
    @user = User.second.first_name
    @trips = Trip.all
  end
end
