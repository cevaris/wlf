class CreateEventRewards < ActiveRecord::Migration
  def change
    create_table :event_rewards do |t|
      t.string :name
      t.money :price
      t.text :description
      t.references :event, index: true

      t.timestamps
    end
  end
end
