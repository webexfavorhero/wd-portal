class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.decimal :subtotal, precision: 12, scale: 3
      t.decimal :discount, precision: 12, scale: 3
      t.decimal :total, precision: 12, scale: 3
      t.references :order_status, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
