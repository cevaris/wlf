class EventSubmissionsController < ApplicationController
  before_action :set_event_submission, only: [:show, :edit, :update, :destroy]
  before_action :set_event

  respond_to :html

  def index
    @event_submissions = EventSubmission.all
    respond_with(@event, @event_submission)
  end

  def show
    respond_with(@event, @event_submission)
  end

  def new
    @event_submission = EventSubmission.new
    respond_with(@event, @event_submission)
  end

  def edit
  end

  def create
    @event_submission = EventSubmission.new(event_submission_params)
    @event_submission.save
    respond_with(@event, @event_submission)
  end

  def update
    @event_submission.update(event_submission_params)
    respond_with(@event, @event_submission)
  end

  def destroy
    @event_submission.destroy
    respond_with(@event, @event_submission)
  end

  private
  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_event_submission
    @event_submission = EventSubmission.find(params[:id])
  end

  def event_submission_params
    params.require(:event_submission).permit(:event_id, :account_id)
  end
end
