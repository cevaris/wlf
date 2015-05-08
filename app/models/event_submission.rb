class EventSubmission < ActiveRecord::Base
  belongs_to :account
  belongs_to :event

  has_many :form_answers
  accepts_nested_attributes_for :form_answers,
                                :reject_if => :all_blank,
                                :allow_destroy => true

  validates_uniqueness_of :event,
                          scope: :account,
                          mesage: 'already has a submission.'
end
