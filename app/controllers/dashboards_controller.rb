class DashboardsController < ApplicationController
  def show
    @trips = Trip.where(organizer_id: params[:id])
    @organizer = User.find(params[:id])
  end
end
