require 'ext/string'

class Event < ActiveRecord::Base
  belongs_to :account
  alias_attribute :creator, :account
  validates :name, presence: true, allow_blank: false
  validates :description, presence: true, allow_blank: false
  validates :start_date, presence: true, allow_blank: false

  validate :validate_json_format

  protected

  def validate_json_format
    unless self.field_schema.is_json?
      errors[:base] << "Field Schema is an invalid format"
    end
  end

end
