class EventSubmission < ActiveRecord::Base
  belongs_to :account
  belongs_to :event
  belongs_to :payment_card

  has_many :form_answers, dependent: :destroy
  validates_associated :form_answers
  accepts_nested_attributes_for :form_answers,
                                :reject_if => :all_blank,
                                :allow_destroy => true

  validates_uniqueness_of :event,
                          scope: :account,
                          message: lambda { |x,y| "has already has your submission" }
end
