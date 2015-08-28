class CreateUserProfessions < ActiveRecord::Migration
  def change
    create_table :user_professions do |t|
      t.integer :user_id
      t.integer :occupation_id
      t.float :income

      t.timestamps null: false
    end
  end
end
