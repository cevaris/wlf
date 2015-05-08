class CreateFormAnswers < ActiveRecord::Migration
  def change
    create_table :form_answers do |t|
      t.text :value
      t.references :form_question, index: true

      t.timestamps
    end
  end
end
