class AddGoalPinterestToSpreeCauses < ActiveRecord::Migration
  def change
			add_column :spree_causes, :goal_pinterest, :integer  
		end
end
