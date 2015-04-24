class AddAddressRefToAccount < ActiveRecord::Migration

  def self.up
    add_reference :accounts, :address, index: true
    Account.all.each {|a| a.save!}
  end

  def self.down
    remove_reference :accounts, :address, index: true
  end

end
