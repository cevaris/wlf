class Event < ActiveRecord::Base
  belongs_to :account
  alias_attribute :creator, :account

  has_many :form_questions
  accepts_nested_attributes_for :form_questions,
                                :reject_if => :all_blank,
                                :allow_destroy => true

  validates :name, presence: true, allow_blank: false
  validates :description, presence: true, allow_blank: false
  validates :start_date, presence: true, allow_blank: false

end
