class CreateUserHobbies < ActiveRecord::Migration
  def change
    create_table :user_hobbies do |t|
      t.integer :user_id
      t.string :hobby_name

      t.timestamps null: false
    end
  end
end
