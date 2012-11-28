class Artist < ActiveRecord::Base
  attr_accessible :address, :age, :email, :last_name, :link_facebook, :link_twitter, :name, :place, :telephone, :type_art, :webpage
end
