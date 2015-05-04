class AddAccountRoleRefToAccount < ActiveRecord::Migration

  def self.up
    add_reference :accounts, :account_role, index: true

    # Create Account Roles
    roles = AccountRole::ROLES.map(&:to_s).map(&:titlecase)
    roles.each {|n| AccountRole.find_or_create_by(name: n)}

    # Assign default Account Roles
    Account.where(account_role:nil).each do |a|
      a.account_role = AccountRole.get(:basic)
      a.save
    end
  end

  def self.down
    remove_reference :accounts, :account_role
  end

end
