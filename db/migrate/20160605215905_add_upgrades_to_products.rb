class AddUpgradesToProducts < ActiveRecord::Migration
  def change
    add_column :products, :upgrades, :text, array: true, default: []
  end
end
