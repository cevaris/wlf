class AddCardToEventSubmission < ActiveRecord::Migration
  def change
    add_reference :event_submissions, :card, index: true
  end
end
