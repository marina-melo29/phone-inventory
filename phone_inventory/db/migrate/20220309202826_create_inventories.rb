class CreateInventories < ActiveRecord::Migration[5.0]
  def change
    create_table :inventories do |t|
      t.string :manufacturer, limit: 25
      t.string :model, limit: 30
      t.string :color, limit: 30
      t.string :carrier_plan_type, limit: 3
      t.integer :quantity
      t.float :price 

      t.timestamps null: false
    end
  end
end
