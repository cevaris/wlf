class EventSubmission < ActiveRecord::Base
  belongs_to :account
  belongs_to :event

  validates_uniqueness_of :event,
                          scope: :account,
                          mesage: 'already has a submission.'
end
