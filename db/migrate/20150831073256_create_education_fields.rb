class CreateEducationFields < ActiveRecord::Migration
  def change
    create_table :education_fields do |t|
      t.string :field_name

      t.timestamps null: false
    end
  end
end
