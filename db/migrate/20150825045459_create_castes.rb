class CreateCastes < ActiveRecord::Migration
  def change
    create_table :castes do |t|
      t.string :caste_name

      t.timestamps null: false
    end
  end
end
