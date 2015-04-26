class Event < ActiveRecord::Base
  include EventsHelper
  validates :name, presence: true, allow_blank: false
  validates :description, presence: true, allow_blank: false
  validates :start_date, presence: true, allow_blank: false

  # def start_date=(date)
  #   parse_datetime(date)
  # end

  # def end_date=(date)
  #   parse_datetime(date)
  # end

end
