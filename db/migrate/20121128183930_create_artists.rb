class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.string :last_name
      t.text :address
      t.integer :age
      t.string :type_art
      t.string :webpage
      t.string :link_twitter
      t.string :link_facebook
      t.string :email
      t.string :telephone
      t.text :place

      t.timestamps
    end
  end
end
