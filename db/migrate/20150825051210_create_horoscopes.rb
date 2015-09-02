class CreateHoroscopes < ActiveRecord::Migration
  def change
    create_table :horoscopes do |t|
      t.integer :user_id
      t.string :horoscope_name

      t.timestamps null: false
    end
  end
end
