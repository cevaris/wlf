class AddEventToFormQuestion < ActiveRecord::Migration
  def change
    add_reference :form_questions, :event, index: true
  end
end
