class EventsController < ApplicationController
	before_action :set_event, only: [:show, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
  end

  # GET /events/1
  # GET /events/1.json
  def show
    render json: @event
  end

  def new
    @event = Event.new
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    if @event.save
      render json: @event, status: :created, location: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  def edit
    
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      head :no_content
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    
    head :no_content
  end

  private

    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:event_date, :location, :num_of_attendees, :organization_id)
    end
end