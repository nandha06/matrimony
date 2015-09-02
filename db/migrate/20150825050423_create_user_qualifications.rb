class CreateUserQualifications < ActiveRecord::Migration
  def change
    create_table :user_qualifications do |t|
      t.integer :user_id
      t.integer :education_level_id     
      t.integer :education_field_id
      t.integer :education_id
      t.string :working_with
      t.integer :occupation_id
      t.integer :annual_income_id

      t.timestamps null: false
    end
  end
end
