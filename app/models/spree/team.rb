class Spree::Team < ActiveRecord::Base
  attr_accessible :fullname, :jobp, :photo

  validates_attachment_presence :photo

  validates_attachment_content_type :photo,
  :content_type => ['image/jpg', 'image/png', 'image/jpeg'],
  :message => "must be jpg, png, jpeg"

  #Configurations Paperclip
  has_attached_file :photo,
    :styles => {:mini => "48x48>", :small=>"100x100>", :product=>"306x407!", :org =>"95x63!", :photomember =>"196x196!"},
    :storage => Rails.env == 'production' ? 's3' : 'filesystem',
    :s3_credentials => {
    :access_key_id => Spree::Config[:s3_access_key],
    :secret_access_key => Spree::Config[:s3_secret]
    },
    :bucket => Spree::Config[:s3_bucket]


end
