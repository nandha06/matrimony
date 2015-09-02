class CreateAnnualIncomes < ActiveRecord::Migration
  def change
    create_table :annual_incomes do |t|
      t.string :income_type

      t.timestamps null: false
    end
  end
end
