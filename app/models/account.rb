class Account < ActiveRecord::Base
  belongs_to :user
  validates :first_name, presence: true, allow_blank: false
  validates :last_name, presence: true, allow_blank: false
end
