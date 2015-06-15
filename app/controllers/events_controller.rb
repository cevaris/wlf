class EventsController < ApplicationController
  load_and_authorize_resource
  before_action :set_event, only: [:show, :edit, :update, :destroy, :report]

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

  def report
    @event_submissions = EventSubmission.where(event_id: @event.id)
    logger.info "EVENT SUBMISSIONS #{@event_submissions.inspect}"

    names = [
      'event_name',
      'event_creator_name',
      'submitter_name',
      'submitter_email',
      'submitted_at',
      'total_donation'
    ] << @event.form_questions.map(&:name)

    data = CSV.generate do |csv|
      csv << names.flatten
      @event_submissions.each do |es|
        row = [
          @event.name,
          @event.account.name,
          es.account.name,
          es.account.user.email,
          es.created_at,
          es.event_rewards.map(&:price).sum
        ] << es.form_answers.map(&:value)
        csv << row.flatten
      end
    end

    respond_to do |format|
      format.csv { render text: data }
      # format.xls { send_data @events.to_csv(col_sep: "\t") }
    end
  end

  private
    def set_event
      begin
        @event = Event.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        @event = Event.find(params[:event_id])
      end
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
