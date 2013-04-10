class AddTitleshareToSpreeCause < ActiveRecord::Migration
  def change
    add_column :spree_causes, :titleshare, :string
  end
end
