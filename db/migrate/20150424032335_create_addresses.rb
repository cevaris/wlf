class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :venue_name
      t.string :first_line
      t.string :second_line
      t.string :city
      t.string :state
      t.string :zipcode

      t.timestamps
    end
  end
end
