class CreateSpreeCauses < ActiveRecord::Migration
  def change
    create_table :spree_causes do |t|
      t.string :title
      t.text :description
      t.integer :goal_facebook
      t.integer :goal_twitter
      t.decimal :goal_money
      t.string :link_facebook
      t.string :link_twitter
      t.has_attached_file :photo
      t.text :video
      t.string :link_pinterest
      t.boolean :status
      t.references :artist
      t.references :organization

      t.timestamps
    end
    add_index :spree_causes, :artist_id
    add_index :spree_causes, :organization_id
  end
end
