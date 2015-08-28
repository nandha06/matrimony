class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.integer :country_id
      t.integer :state_id
      t.integer :city_id
      t.integer :residenttype_id

      t.timestamps null: false
    end
  end
end
