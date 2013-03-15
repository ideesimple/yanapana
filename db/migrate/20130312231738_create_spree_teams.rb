class CreateSpreeTeams < ActiveRecord::Migration
  def change
    create_table :spree_teams do |t|
      t.string :fullname
      t.string :jobp

      t.timestamps
    end
  end
end
