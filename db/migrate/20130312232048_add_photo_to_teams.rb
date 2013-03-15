class AddPhotoToTeams < ActiveRecord::Migration
  def self.up
    change_table :spree_teams do |t|
      t.has_attached_file :photo
    end
  end

  def self.down
    drop_attached_file :spree_teams, :photo
  end
end
