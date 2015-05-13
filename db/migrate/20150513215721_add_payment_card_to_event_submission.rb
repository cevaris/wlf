class AddPaymentCardToEventSubmission < ActiveRecord::Migration
  def change
    add_reference :event_submissions, :payment_card, index: true
  end
end
