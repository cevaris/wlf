class Account < ActiveRecord::Base
  belongs_to :user

  # Used internally for permission handling
  belongs_to :account_role
  # Used by the app for account handling
  belongs_to :account_type
  validates :account_type, presence: true, allow_blank: false

  belongs_to :address
  accepts_nested_attributes_for :address

  validates :first_name, presence: true, allow_blank: false
  validates :last_name, presence: true, allow_blank: true

  def name
    # If company, render company_name
    # else render first/last name
    "#{self.first_name.titleize} #{self.last_name.titleize}"
  end

  before_save :default_values
  def default_values
    self.address ||= Address.create
    self.account_role ||= AccountRole.get(:basic)
    self.account_type ||= AccountType.get(:individual)
  end
end
