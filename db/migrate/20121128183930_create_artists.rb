class CreateArtists < ActiveRecord::Migration
  def change
    create_table :spree_artists do |t|
      t.string :name
      t.string :last_name
      t.text :address
      t.date :date_of_birth
      t.string :type_art
      t.string :webpage
      t.string :portfolio
      t.string :link_twitter
      t.string :link_facebook
      t.string :email
      t.string :telephone
      t.text :place
      t.string :sex	

      t.timestamps
    end
  end
end
