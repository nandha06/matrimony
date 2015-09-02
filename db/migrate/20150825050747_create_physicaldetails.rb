class CreatePhysicaldetails < ActiveRecord::Migration
  def change
    create_table :physicaldetails do |t|
      t.integer :user_id
      t.decimal :height
      t.decimal :weight
      t.string :skin_tone
      t.string :hair_color
      t.string :eye_color
      t.string :physical_status
      t.string :body_type
      t.string :health_condition

      t.timestamps null: false
    end
  end
end
