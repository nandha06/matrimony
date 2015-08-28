class CreatePhysicaldetails < ActiveRecord::Migration
  def change
    create_table :physicaldetails do |t|
      t.decimal :height
      t.decimal :weight
      t.string :skin_tone
      t.string :hair_color
      t.string :eye_color
      t.integer :physical_status
      t.integer :body_type

      t.timestamps null: false
    end
  end
end
