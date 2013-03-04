class AddIsartistToUsers < ActiveRecord::Migration
  def change
    change_table :spree_users do |t|
      t.boolean :isartist
    end
  end
end
