class EventsController < ApplicationController
  load_and_authorize_resource
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
    @event = Event.new(event_params)
    @event = @event.set_dates(event_params)
    @event.save
    respond_with(@event)
  end

  def update
    logger.info event_params
    @event.update(event_params)
    @event = @event.set_dates(event_params)
    @event.save
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
      params.require(:event).permit(
        :name,
        :account_id,
        :description,
        :start_date,
        :end_date,
        :timezone,
        form_questions_attributes: [
          :id,
          :name,
          :field_type,
          :_destroy
        ],
        event_rewards_attributes: [
          :id,
          :name,
          :description,
          :price,
          :_destroy
        ]
      )
    end
end
