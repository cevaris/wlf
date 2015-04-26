class Address < ActiveRecord::Base
  ABBR_STATES = %w(AK AL AZ AR CA CO CT DE FL GA HI ID IL IN IA KS KY LA ME MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT VT VA WA WV WI WY)

  validates :first_line, presence: true, allow_blank: true
  validates :city, presence: true, allow_blank: true
  validates :state, presence: true, allow_blank: true
end
