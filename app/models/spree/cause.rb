class Spree::Cause < ActiveRecord::Base
  require "addressable/uri"

  belongs_to :artist
  belongs_to :organization
  has_many :products
  attr_accessible :description, :goal_facebook, :goal_money, :goal_twitter, :link_facebook, :link_pinterest, :link_twitter, :photo, :status, :title, :video, :artist_id, :organization_id, :date_start, :date_finish, :number_goal, :status

  validates :title, :description, :artist_id, :organization_id, :goal_money, :goal_facebook, :goal_twitter, :number_goal, :presence => true


  validates_attachment_presence :photo

  validates_attachment_content_type :photo,
    :content_type => ['image/jpg', 'image/png', 'image/jpeg'],
    :message => "must be jpg, png, jpeg"

#Configurations Paperclip
  has_attached_file :photo,
    :styles => {:small=>"100x100>", :product=>"240x240>"},
    :storage => Rails.env == 'production' ? 's3' : 'filesystem',
    :s3_credentials => {
    :access_key_id => Spree::Config[:s3_access_key],
    :secret_access_key => Spree::Config[:s3_secret]
    },
    :bucket => Spree::Config[:s3_bucket]

before_save :youtube
before_update :youtube

 def youtube
  uri = Addressable::URI.parse(self.video)
  if uri.query_values
      self.video = uri.query_values["v"].to_s
  end
 end

end
