class ReimbursementsController < ApplicationController

  before_action :check_login
	before_action :set_reimbursement, only: [:show, :update, :destroy]

  # Register for zipped files
  Mime::Type.register "application/zip", :zip

  # GET /reimbursements
  # GET /reimbursements.json
  def index
    # TO BE FIXED: Return for user rather than all requests
    @reimbursements = Reimbursement.chronological
    render json: @reimbursements
  end

  # GET /reimbursements/1
  # GET /reimbursements/1.json
  def show
    render json: @reimbursement
  end

  def new
    @reimbursement = Reimbursement.new
  end

  # POST /reimbursements
  # POST /reimbursements.json
  def create
    @reimbursement = Reimbursement.new(reimbursement_params)
    # requester set to current user
    @reimbursement.requester_id = User.find(session[:user_id])
    @reimbursement.request_date = Date.today()
    # @reimbursement.status = 'Submitted'
    if @reimbursement.save
      render json: @reimbursement, status: :created, location: @reimbursement
    else
      render json: @reimbursement.errors, status: :unprocessable_entity
    end
  end

  def edit
  end

  # PATCH/PUT /reimbursements/1
  # PATCH/PUT /reimbursements/1.json
  def update
    @reimbursement = Reimbursement.find(params[:id])

    if @reimbursement.update(reimbursement_params)
      head :no_content
    else
      render json: @reimbursement.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reimbursements/1
  # DELETE /reimbursements/1.json
  def destroy
    @reimbursement.destroy
    
    head :no_content
  end

  private

    def set_reimbursement
      @reimbursement = Reimbursement.find(params[:id])
    end

    def reimbursement_params
      params.require(:reimbursement).permit(:total, :description, :event_date, :event_name, :event_location, :num_of_attendees, :organization, :receipt_images)
    end
end