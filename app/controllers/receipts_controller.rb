class ReceiptsController < ApplicationController
  def index
    authenticate!
    @trip = Trip.find(params[:trip_id])
    @receipts = @trip.receipts
  end

  def new
    authenticate!
    @trip = Trip.find(params[:trip_id])
  end

  def create
    authenticate!
    @trip = Trip.find(params[:trip_id])
    p receipt_params
    @receipt = Receipt.new(receipt_params)
    if @receipt.save
      redirect_to trip_receipt_path(@receipt)
    else
      render action: "new"
    end
  end

  def show
    authenticate!
    @receipt = Receipt.find(params[:id])
  end

  private
  def receipt_params
    params.permit(:total, :store, :photo).merge(purchaser: current_user, trip: @trip)
  end
end
