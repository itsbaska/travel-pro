class TripsController < ApplicationController
  def index
    @user = User.second.first_name
  end
end
