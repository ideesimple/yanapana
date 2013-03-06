class Spree::Artist < ActiveRecord::Base
  has_many :causes
  accepts_nested_attributes_for :causes

  attr_accessible :address, :date_of_birth, :email, :last_name, :link_facebook, :link_twitter, :name, :place, :telephone, :type_art, :webpage, :photo, :reason, :portfolio, :sex, :state, :city, :zip

  #validations
  validates :name, :last_name, :email, :date_of_birth, :sex, :reason, :webpage, :presence => true

  validates_attachment_presence :photo

  validates_attachment_content_type :photo,
  :content_type => ['image/jpg', 'image/png', 'image/jpeg'],
  :message => "must be jpg, png, jpeg"

  #Configurations Paperclip
  has_attached_file :photo,
    :styles => {:mini => "48x48>", :small=>"100x100>", :product=>"306x407!", :org =>"95x63!"},
    :storage => Rails.env == 'production' ? 's3' : 'filesystem',
    :s3_credentials => {
    :access_key_id => Spree::Config[:s3_access_key],
    :secret_access_key => Spree::Config[:s3_secret]
    },
    :bucket => Spree::Config[:s3_bucket]

  after_create :create_account

  def create_account
    account = Spree::User.new
    account.email = self.email
    account.password = Spree::User.generate_token(:persistence_token)
    account.save
    Spree::UserMailer.reset_password_instructions(account).deliver
  end

end
