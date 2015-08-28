class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.string :course_name

      t.timestamps null: false
    end
  end
end
