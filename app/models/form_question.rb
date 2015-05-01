class FormQuestion < ActiveRecord::Base
  FIELD_TYPE = %w(text number email phone).map(&:titlecase)

  validates :name, presence: true, allow_blank: false
  validates :field_type, presence: true, allow_blank: false
end
