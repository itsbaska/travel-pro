class DashboardsController < ApplicationController
  def show
    authenticate!

    @user = User.find(params[:id])
    @organized_trips = @user.trips
    @travelling_trips = @user.travel_trips
  end
end
