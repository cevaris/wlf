class AccountType < ActiveRecord::Base
  TYPES = [:organization, :individual]

  has_many :accounts

  def self.get(name)
    name = name.to_s.titlecase
    AccountType.find_by_name(name)
  end
end
