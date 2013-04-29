class ChangeDateForDateStart < ActiveRecord::Migration
  def up
			 change_table :spree_causes do |t|
      t.change :date_start, :datetime
						t.change :date_finish, :datetime
    end  
		end  
    
  def down
			change_table :spree_causes do |t|
      t.change :date_start, :date
						t.change :date_finish, :date
   end  
		end
end
