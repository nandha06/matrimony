class CreateResidenttypes < ActiveRecord::Migration
  def change
    create_table :residenttypes do |t|
      t.string :type_name

      t.timestamps null: false
    end
  end
end
