class CreateRasis < ActiveRecord::Migration
  def change
    create_table :rasis do |t|
      t.integer :nakshatra_id
      t.string :rasi_name

      t.timestamps null: false
    end
  end
end
