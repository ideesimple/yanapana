class Spree::Organization < ActiveRecord::Base
  has_many :causes
  accepts_nested_attributes_for :causes

  attr_accessible :contact, :country, :description, :email, :link_facebook, :link_twitter, :name, :phonenumber, :photo, :video, :webpage, :contact_name, :exemption_number, :contact_number, :address, :state, :city, :zip

  validates :name, :description, :contact, :contact_name, :contact_number, :webpage, :presence => true

  validates_attachment_presence :photo

  validates_attachment_content_type :photo,
    :content_type => ['image/jpg', 'image/png', 'image/jpeg'],
    :message => "must be jpg, png, jpeg"


  #Configurations Paperclip
  has_attached_file :photo,
    :styles => {:mini => "48x48>", :small=>"100x100>", :product=>"306x407>", :org =>"95x63>"},
    :storage => Rails.env == 'production' ? 's3' : 'filesystem',
    :s3_credentials => {
    :access_key_id => Spree::Config[:s3_access_key],
    :secret_access_key => Spree::Config[:s3_secret]
    },
    :bucket => Spree::Config[:s3_bucket]

end
