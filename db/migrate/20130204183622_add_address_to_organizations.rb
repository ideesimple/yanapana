class AddAddressToOrganizations < ActiveRecord::Migration
  def change
    add_column :spree_organizations, :address, :text
    add_column :spree_organizations, :state, :string
    add_column :spree_organizations, :city, :string
    add_column :spree_organizations, :zip, :string
  end
end
