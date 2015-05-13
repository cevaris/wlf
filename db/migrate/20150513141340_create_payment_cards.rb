class CreatePaymentCards < ActiveRecord::Migration
  def change
    create_table :payment_cards do |t|
      t.string :name
      t.string :brand
      t.string :last4
      t.string :stripe_token
      t.string :card_token

      t.timestamps
    end
  end
end
