class AddInspirationToCauses < ActiveRecord::Migration
  def change
    add_column :spree_causes, :inspiration, :text
  end
end
