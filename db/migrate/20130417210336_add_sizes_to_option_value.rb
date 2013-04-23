class AddSizesToOptionValue < ActiveRecord::Migration
  def self.up
    change_table :spree_option_values do |t|
      t.string :chest
						t.string :waist
						t.string :lenght
    end
  end

  def self.down
    remove_column :spree_option_values, :chest
				remove_column :spree_option_values, :waist
				remove_column :spree_option_values, :lenght
  end
end
