class CreateFormQuestions < ActiveRecord::Migration
  def change
    create_table :form_questions do |t|
      t.string :name
      t.string :field_type

      t.timestamps
    end
  end
end
