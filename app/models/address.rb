class Address < ActiveRecord::Base
  validates :first_line, presence: true, allow_blank: true
  validates :city, presence: true, allow_blank: true
  validates :state, presence: true, allow_blank: true
end
