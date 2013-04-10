class AddPhotosocialToCause < ActiveRecord::Migration
  def self.up
    change_table :spree_causes do |t|
      t.has_attached_file :sharephoto
    end
  end

  def self.down
    drop_attached_file :spree_causes, :sharephoto
  end
end
