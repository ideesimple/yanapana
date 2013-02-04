class AddAddressToArtists < ActiveRecord::Migration
  def change
    add_column :spree_artists, :state, :string
    add_column :spree_artists, :city, :string
    add_column :spree_artists, :zip, :string
  end
end
