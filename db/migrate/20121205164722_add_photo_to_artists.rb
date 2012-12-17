class AddPhotoToArtists < ActiveRecord::Migration
    def self.up
      change_table :spree_artists do |t|
        t.has_attached_file :photo
      end
    end

    def self.down
      drop_attached_file :spree_artists, :photo
    end
end
