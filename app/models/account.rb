class Account < ActiveRecord::Base
  belongs_to :user

  belongs_to :address
  accepts_nested_attributes_for :address

  validates :first_name, presence: true, allow_blank: false
  validates :last_name, presence: true, allow_blank: true

  def full_name
    "#{self.first_name.titleize} #{self.last_name.titleize}"
  end

  before_save :default_values
  def default_values
    self.address ||= Address.create
  end
end
