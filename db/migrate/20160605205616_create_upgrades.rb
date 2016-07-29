class CreateUpgrades < ActiveRecord::Migration
  def change
    create_table :upgrades do |t|
      t.integer :pu_id
      t.integer :pu_status
      t.string :pu_name
      t.string :pug_name
      t.integer :pug_status
      t.integer :inv_hide
      t.integer :plan_inv_hide
      t.integer :pu_priority

      t.timestamps null: false
    end
  end
end
