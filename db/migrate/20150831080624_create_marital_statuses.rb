class CreateMaritalStatuses < ActiveRecord::Migration
  def change
    create_table :marital_statuses do |t|
      t.string :marital_status
      
      t.timestamps null: false
    end
  end
end
