class AddPortofolioToArtists < ActiveRecord::Migration
    def self.up
      change_table :spree_artists do |t|
        t.string :portfolio
        t.text :reason
      end
    end

    def self.down
      remove_column :spree_artists, :portfolio
      remove_column :spree_artists, :reason
    end

  end
