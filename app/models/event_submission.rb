class EventSubmission < ActiveRecord::Base
  include ApplicationHelper

  belongs_to :account
  belongs_to :event

  belongs_to :payment_card
  accepts_nested_attributes_for :payment_card,
                                :reject_if => :all_blank

  has_many :form_answers, dependent: :destroy
  validates_associated :form_answers
  accepts_nested_attributes_for :form_answers,
                                :reject_if => :all_blank,
                                :allow_destroy => true

  serialize :selected_rewards

  validates_uniqueness_of :event,
                          scope: :account,
                          message: lambda { |x,y| "has already been submitted" }


  def formatted_created_at
    formatted_date(self.created_at, self.event.timezone)
  end

  def event_rewards
    EventReward.find(
      self.selected_rewards.reject(&:empty?).map(&:to_i)
    )
  end

end
