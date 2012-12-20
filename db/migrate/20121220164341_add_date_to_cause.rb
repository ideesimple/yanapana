class AddDateToCause < ActiveRecord::Migration
  def change
    add_column :spree_causes, :date_start, :date
    add_column :spree_causes, :date_finish, :date
  end
end
