class EventSubmissionsController < ApplicationController
  include PaymentCardsHelper

  load_and_authorize_resource :event
  load_and_authorize_resource :event_submission, through: :event

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
    @event_submission.build_payment_card
    @event.form_questions.each do |q|
      @event_submission.form_answers.build(
        event_submission: @event_submission,
        form_question: q
      )
    end
    respond_with(@event, @event_submission)
  end

  def edit
  end

  def create
    @event_submission = EventSubmission.new(event_submission_params)
    @event_submission.payment_card = token_create(
      event_submission_params['payment_card_attributes']
    )
    logger.info @event_submission.payment_card.inspect
    #@event_submission.save
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
    params.require(:event_submission).permit(
      :event_id,
      :account_id,
      form_answers_attributes: [
        :id,
        :event_submission_id,
        :form_question_id,
        :value,
        :_destroy
      ],
      payment_card_attributes: [
        :number,
        :cvc,
        :exp_month,
        :exp_year
      ]
    )
  end
end
