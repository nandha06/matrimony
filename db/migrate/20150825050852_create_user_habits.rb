class CreateUserHabits < ActiveRecord::Migration
  def change
    create_table :user_habits do |t|
      t.integer :user_id
      t.integer :diet
      t.integer :drinking
      t.integer :smoking

      t.timestamps null: false
    end
  end
end
