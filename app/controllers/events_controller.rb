class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @events = Event.all
    respond_with(@events)
  end

  def show
    respond_with(@event)
  end

  def new
    @event = Event.new
    respond_with(@event)
  end

  def edit
  end

  def create
    # mod_event_params = event_params
    # if event_params[:start_date]
    #   mod_event_params[:start_date] = Date.strptime(event_params[:start_date], '%m/%d/%Y %I:%M %p')
    # end
    # if event_params[:end_date]
    #   mod_event_params[:end_date] = Date.strptime(event_params[:end_date], '%m/%d/%Y %I:%M %p')
    # end

    @event = Event.new(event_params)
    @event.save
    respond_with(@event)
  end

  def update
    @event.update(event_params)
    respond_with(@event)
  end

  def destroy
    @event.destroy
    respond_with(@event)
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:name, :description, :start_date, :end_date, :timezone, :field_schema)
    end
end
