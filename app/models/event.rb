class Event < ActiveRecord::Base
  belongs_to :account

  has_many :event_submissions

  has_many :event_rewards, -> { order('created_at').order('price_cents') }
  validates_associated :event_rewards
  accepts_nested_attributes_for :event_rewards,
                                :reject_if => :all_blank,
                                :allow_destroy => true

  has_many :form_questions
  validates_associated :form_questions
  accepts_nested_attributes_for :form_questions,
                                :reject_if => :all_blank,
                                :allow_destroy => true

  validates :name, presence: true, allow_blank: false
  validates :description, presence: true, allow_blank: false
  validates :start_date, presence: true, allow_blank: false
  # validates :end_date, presence: true, allow_blank: false


  def formatted_date(date, timezone, format=:llllz)
    unless date.nil?
      I18n.l date.in_time_zone(timezone), format: format
    else
      nil
    end
  end

  def formatted_start_date
    formatted_date(self.start_date, self.timezone)
  end

  def formatted_end_date
    formatted_date(self.end_date, self.timezone)
  end

  def set_dates(params)
    # debugger
    if self.timezone
      parser = ActiveSupport::TimeZone[self.timezone]

      if params.include? 'start_date' and not params['start_date'].empty?
        self.start_date = parser.parse(params['start_date']).utc
      end
      if params.include? 'end_date' and not params['end_date'].empty?
        self.end_date = parser.parse(params['end_date']).utc
      end
    end
    self
  end

end
