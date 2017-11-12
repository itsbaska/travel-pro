class ReceiptsController < ApplicationController
  def new
    @trip = Trip.find(params[:trip_id])
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @receipt = Receipt.new(receipt_params)
    if @receipt.save
      redirect_to receipt_path(@receipt)
    else
      render action: "new"
    end
  end

  def show
    @receipt = Receipt.find(params[:id])
  end

  private
  def receipt_params
    params.require(:receipt).permit(:total, :store, :photo).merge(purchaser: current_user, trip: @trip)
  end
end
