class ReceiptsController < ApplicationController
  def new
  end

  def create
    @receipt = Receipt.new(receipt_params)
    @receipt.purchaser_id = current_user.id
    @receipt.trip_id = params[:trip_id]
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
    params.require(:receipt).permit(:total, :store, :photo)
  end
end
