class CreateEventSubmissions < ActiveRecord::Migration
  def change
    create_table :event_submissions do |t|
      t.references :account, index: true
      t.references :event, index: true

      t.timestamps
    end
  end
end
