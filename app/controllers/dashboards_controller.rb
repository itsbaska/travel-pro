class DashboardsController < ApplicationController
  def show
    @trips = Trip.where(organizer_id: params[:id])
    @organizer = User.find(params[:id])

    @groupings = []
    trip_ids = @trips.pluck(:id)
    trip_ids.each do |id|
      @groupings << Travelgrouping.find_by(trip_id: id)
    end
    @travellers = []
    @groupings.each do |grouping|
      @travellers << User.find(grouping.traveller_id)
    end
  end
end
