class CreateUserEducations < ActiveRecord::Migration
  def change
    create_table :user_educations do |t|
      t.integer :user_id
      t.integer :education_id

      t.timestamps null: false
    end
  end
end
