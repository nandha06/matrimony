class CreateUserFamilies < ActiveRecord::Migration
  def change
    create_table :user_families do |t|
      t.integer :father_status_id
      t.integer :mother_status_id
      t.integer :no_of_brother
      t.integer :no_of_sister
      t.integer :value
      t.integer :affuluence_level

      t.timestamps null: false
    end
  end
end
