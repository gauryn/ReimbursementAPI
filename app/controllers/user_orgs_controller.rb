class UserOrgsController < ApplicationController

  before_action :check_login
	before_action :set_user_org, only: [:show, :update, :destroy]

  # GET /user_orgs
  # GET /user_orgs.json
  def index
    @user_orgs = UserOrg.active
    render json: @user_orgs
  end

  # TO BE FIXED: IMPLEMENTED SINCE RELATIONS BETWEEN REIMBURSEMENTS AND OTHER MODELS COMMENTED
  def get_orgs_for_user
    user_id = params[:user_id]
    @user_orgs = UserOrg.organizations(user_id)
    render json: @user_orgs
  end

  # GET /user_orgs/1
  # GET /user_orgs/1.json
  def show
    render json: @user_org
  end

  def new
    @user_org = UserOrg.new
  end

  # POST /user_orgs
  # POST /user_orgs.json
  def create
    @user_org = UserOrg.new(user_org_params)
    print("User Org: ", @user_org)
    # By default, currently all students are org members
    @user_org.role = "Member"
    if @user_org.save
      render json: @user_org, status: :created, location: @user_org
    else
      render json: @user_org.errors, status: :unprocessable_entity
    end
  end

  def edit
  end

  # PATCH/PUT /user_orgs/1
  # PATCH/PUT /user_orgs/1.json
  def update
    @user_org = UserOrg.find(params[:id])

    if @user_org.update(user_org_params)
      head :no_content
    else
      render json: @user_org.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_orgs/1
  # DELETE /user_orgs/1.json
  def destroy
    @user_org.destroy
    
    head :no_content
  end

  private

    def set_user_org
      @user_org = UserOrg.find(params[:id])
    end

    def user_org_params
      params.require(:user_org).permit(:role, :start_date, :organization, :user_id)
    end
end