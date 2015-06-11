class AddCustomerTokenToAccount < ActiveRecord::Migration
  def change
    add_column :accounts, :customer_token, :string
  end
end
