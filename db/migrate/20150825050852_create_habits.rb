class CreateHabits < ActiveRecord::Migration
  def change
    create_table :habits do |t|
      t.integer :eating
      t.integer :drinking
      t.integer :smoking

      t.timestamps null: false
    end
  end
end
