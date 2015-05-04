class AddAccountTypeRefToAccount < ActiveRecord::Migration

  def self.up
    add_reference :accounts, :account_type, index: true

    # Create Account Types
    types = AccountType::TYPES.map(&:to_s).map(&:titlecase)
    types.each {|n| AccountType.find_or_create_by(name: n)}

    # Assign default Account Types
    Account.where(account_type:nil).each do |a|
      a.account_type = AccountType.get(:individual)
      a.save
    end
  end

  def self.down
    remove_reference :accounts, :account_type
  end

end
