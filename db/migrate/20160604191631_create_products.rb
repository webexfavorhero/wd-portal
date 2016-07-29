class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :plan_id
      t.string :name
      t.decimal :price, precision: 12, scale: 3
      t.boolean :active
      t.integer :stock

      t.timestamps null: false
    end
  end
end
