class AddEventSubmissionToFormAnswer < ActiveRecord::Migration
  def change
    add_reference :form_answers, :event_submission, index: true
  end
end
