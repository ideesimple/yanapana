class Spree::Cause < ActiveRecord::Base
  belongs_to :artist
  belongs_to :organization
  has_many :products
  attr_accessible :description, :goal_facebook, :goal_money, :goal_twitter, :link_facebook, :link_pinterest, :link_twitter, :photo, :status, :title, :video, :artist_id, :organization_id


  validates_attachment_presence :photo
  validates_attachment_content_type :photo,
    :content_type => ['image/jpg', 'image/png', 'image/jpeg'],
    :message => "must be jpg, png, jpeg"

#Configurations Paperclip
  has_attached_file :photo,
    :styles => {:medium=>"300x300>", :thumb=>"100x100>"},
    :storage => Rails.env == 'production' ? 's3' : 'filesystem',
    :s3_credentials => {
    :access_key_id => Spree::Config[:s3_access_key],
    :secret_access_key => Spree::Config[:s3_secret]
    },
    :bucket => Spree::Config[:s3_bucket]

end
