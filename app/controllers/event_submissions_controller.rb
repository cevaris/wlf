class EventSubmissionsController < ApplicationController
  include EventSubmissionsHelper
  include PaymentCardsHelper

  load_and_authorize_resource :event, except: [:calculate]
  load_and_authorize_resource :event_submission,
                              through: :event,
                              except: [:calculate]

  before_action :set_event_submission, only: [:show, :edit, :update, :destroy]
  before_action :set_event, only: [:show, :edit, :update, :destroy]

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
    logger.info @event_submission.inspect

    # @selected_rewards = get_event_rewards(
    #   @event_submission['selected_rewards']
    # )
    # logger.info @selected_rewards.inspect

    # @total_cost = calculate_event_rewards_total(@selected_rewards)
    # logger.info "Total Cost #{@total_cost}"


    # card_data = create_stripe_hash(
    #   event_submission_params['payment_card_attributes']
    # )
    # logger.info card_data.inspect

    # stripe_token = Api::Stripe.token_create(card_data)
    # logger.info stripe_token.inspect

    # payment_card = Api::Stripe.from_stripe_token(stripe_token)
    # logger.info payment_card.inspect

    # charge = Api::Stripe.charge_create(
    #   stripe_data['email'],
    #   payment_card.stripe_token,
    #   @total_cost
    # )
    # logger.info "Successfull charge #{charge.inspect}"

    # From Customer

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

  def calculate
    if params.include? 'event_submission'
      @selected_rewards = get_event_rewards(
        params['event_submission']['selected_rewards']
      )
      logger.info @selected_rewards.inspect

      @total_cost = calculate_event_rewards_total(@selected_rewards)
      logger.info "Total Cost #{@total_cost}"
      render text: @total_cost
    else
      render text: 0.0
    end
  end

  private
  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_event_submission
    @event_submission = EventSubmission.find(params[:id])
    @report = String.new
    
  end

  def event_submission_params
    params.require(:event_submission).permit(
      :event_id,
      :account_id,
      :selected_rewards => [],
      form_answers_attributes: [
        :id,
        :event_submission_id,
        :form_question_id,
        :value,
        :_destroy
      ],
      payment_card_attributes: [
        :email,
        :number,
        :cvc,
        :exp_month,
        :exp_year
      ]
    )
  end
end
