class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.belongs_to :user, index: true
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
