class CreateSpreeOrganizations < ActiveRecord::Migration
  def change
    create_table :spree_organizations do |t|
      t.string :name
      t.text :description
      t.string :country
      t.string :contact
      t.string :email
      t.string :phonenumber
      t.string :link_twitter
      t.string :link_facebook
      t.text :video
      t.string :webpage
      t.string :contact_name
      t.string :contact_number
      t.string :exemption_number     
 
      t.timestamps
    end
  end
end
