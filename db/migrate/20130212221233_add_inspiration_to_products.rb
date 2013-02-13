class AddInspirationToProducts < ActiveRecord::Migration
  def self.up
    change_table :spree_products do |t|
      t.text :inspiration_behind
    end
  end

  def self.down
    remove_column :spree_products, :inspiration_behind
  end
end
