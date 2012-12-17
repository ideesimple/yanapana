class AddCauseIdToProduct < ActiveRecord::Migration
  def self.up
    change_table :spree_products do |t|
      t.integer :cause_id
    end
  end

  def self.down
    remove_column :spree_products, :cause_id
  end
end
