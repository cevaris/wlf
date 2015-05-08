class FormAnswer < ActiveRecord::Base
  belongs_to :form_question
  belongs_to :event_submission

  validates :value, presence: true, allow_blank: true
end
