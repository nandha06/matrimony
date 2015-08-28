class CreateEducategories < ActiveRecord::Migration
  def change
    create_table :educategories do |t|
      t.string :category_name

      t.timestamps null: false
    end
  end
end
