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
end
