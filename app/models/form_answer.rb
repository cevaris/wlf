class FormAnswer < ActiveRecord::Base
  belongs_to :form_question
  belongs_to :event_submission

  validates :value, presence: true, allow_blank: true

  validate :form_answer_validation

  def form_answer_validation
    # All form answers can be blank
    return if self.value.blank?

    if self.form_question.field_type == 'Text'
    elsif self.form_question.field_type == 'Number'
      unless self.value =~ /^[0-9]+(\.[0-9]{1,2})?$/
        errors.add(
          :base,
          "#{self.value} Not a valid Number. ex; 100, 1.33, 0.1"
        )
      end
    elsif self.form_question.field_type == 'Phone'
      return if self.value.blank?
      unless self.value =~ /^[0-9]{10}$/
        errors.add(
          :base,
          "#{self.value} Not a valid Phone Number; ex 1234567890"
        )
      end
    end
    logger.info errors.inspect
  end

end
