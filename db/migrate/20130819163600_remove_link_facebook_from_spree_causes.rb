class RemoveLinkFacebookFromSpreeCauses < ActiveRecord::Migration
  def up
			remove_column :spree_causes, :link_facebook
			remove_column :spree_causes, :link_twitter
			remove_column :spree_causes, :link_pinterest
  end

  def down
  end
end
