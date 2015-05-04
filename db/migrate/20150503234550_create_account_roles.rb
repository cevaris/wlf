class CreateAccountRoles < ActiveRecord::Migration
  def change
    create_table :account_roles do |t|
      t.string :name
    end
  end
end
