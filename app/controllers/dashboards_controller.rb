class DashboardsController < ApplicationController
  def show
    authenticate!
    @trips = Trip.where(organizer_id: params[:id])
    @organizer = User.find(params[:id])
  end
end
