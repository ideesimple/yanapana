class AddTimeZoneToSpreeCauses < ActiveRecord::Migration
  def change
    add_column :spree_causes, :time_zone, :string
  end
end
