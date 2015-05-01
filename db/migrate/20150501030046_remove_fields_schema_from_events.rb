class RemoveFieldsSchemaFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :field_schema, :text
  end
end
