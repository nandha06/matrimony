class CreateUserastros < ActiveRecord::Migration
  def change
    create_table :userastros do |t|
      t.integer :user_id
      t.integer :rasi_id
      t.integer :nakshatra_id
      t.integer :gothram_id

      t.timestamps null: false
    end
  end
end
