class CreateGothrams < ActiveRecord::Migration
  def change
    create_table :gothrams do |t|
      t.string :gothram_name

      t.timestamps null: false
    end
  end
end
