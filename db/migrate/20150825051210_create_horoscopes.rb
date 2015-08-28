class CreateHoroscopes < ActiveRecord::Migration
  def change
    create_table :horoscopes do |t|
      t.integer :name

      t.timestamps null: false
    end
  end
end
