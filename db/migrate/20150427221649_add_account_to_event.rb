class AddAccountToEvent < ActiveRecord::Migration
  def change
    add_reference :events, :account, index: true
  end
end
