class ReceiptsController < ApplicationController

  before_action :check_login
	before_action :set_receipt, only: [:show, :update, :destroy]

  # Register for zipped files
  Mime::Type.register "application/zip", :zip


  # POST /receipts
  # POST /receipts.json
  def create
    @receipt = Receipt.new(receipt_params)
    if @receipt.save
      render json: @receipt, status: :created, location: @receipt
    else
      render json: @receipt.errors, status: :unprocessable_entity
    end
  end

  def edit
  end


  private

    def set_receipt
      @receipt = Receipt.find(params[:id])
    end

    def receipt_params
      params.require(:receipt).permit(:reimbursement_id, :receipt_images)
    end
end