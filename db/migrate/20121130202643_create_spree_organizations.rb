class CreateSpreeOrganizations < ActiveRecord::Migration
  def change
    create_table :spree_organizations do |t|
      t.string :name
      t.text :description
      t.integer :country
      t.string :contact
      t.string :email
      t.string :phonenumber
      t.string :link_twitter
      t.string :link_facebook
      t.text :video

      t.timestamps
    end
  end
end
