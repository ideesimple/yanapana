class AddWebpageToOrganization < ActiveRecord::Migration
  def change
    add_column :spree_organizations, :webpage, :string
  end
end
