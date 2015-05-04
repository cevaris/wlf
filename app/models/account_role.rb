class AccountRole < ActiveRecord::Base
  ROLES = [:super_admin, :admin, :basic, :disabled]

  has_many :accounts

  def self.get(name)
    name = name.to_s.titlecase
    AccountRole.find_by_name(name)
  end
end
