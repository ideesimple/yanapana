class Spree::Cause < ActiveRecord::Base
  require "addressable/uri"

  belongs_to :artist
  belongs_to :organization
  has_many :products
  attr_accessible :description, :goal_facebook, :goal_money, :goal_twitter, :goal_pinterest, :photo, :status, :title, :video, :artist_id, :organization_id, :date_start, :date_finish, :number_goal, :status, :inspiration, :sharephoto, :titleshare, :time_zone

  validates :title, :description, :organization_id, :goal_money, :goal_facebook, :goal_twitter, :number_goal, :presence => true

  validates :description, :length => {:minimum => 50}
  validates_inclusion_of :time_zone, in: ActiveSupport::TimeZone.zones_map(&:name)

  #validate :cause_id_when_active, :on => :create
  validates_attachment_presence :photo

  validates_attachment_content_type :photo,
    :content_type => ['image/jpg', 'image/png', 'image/jpeg'],
    :message => "must be jpg, png, jpeg"

  validates_attachment_content_type :photo,
    :content_type => ['image/jpg', 'image/jpeg'],
    :message => "must be jpg, jpeg"

#Configurations Paperclip
  has_attached_file :photo,
    :styles => {:small=>"100x100>", :product=>"240x240>", :share_photo => "200x200!"},
    :storage => Rails.env == 'production' ? 's3' : 'filesystem',
    :s3_credentials => {
    :access_key_id => Spree::Config[:s3_access_key],
    :secret_access_key => Spree::Config[:s3_secret]
    },
    :bucket => Spree::Config[:s3_bucket]
  has_attached_file :sharephoto,
    :styles => {:small=>"100x100>", :share_photo => "200x200!"},
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


  #def cause_id_when_active
  #  if self.status == true
  #    if Spree::Cause.where("status = ?", true).count > 0
  #      errors.add( :id, 'there is already an active cause')
  #    end
  #  end
  #end


  def self.per_week
    date_now = Date.today
    by_status = Spree::Cause.where("date_start <= ? AND date_finish <= ?", date_now, date_now).order('date_start ASC').first
  end

  def self.total_money()
      products_per_cause = Spree::Products.where(:cause_id=>self.id)
      variantes = []
      products_per_cause.each do |prod|
        variantes << prod.variants_ids
      end
      lineitems_per_cause = Spree::Order.total_line_items(variantes)

      items_per_cause = Spree::Order.total_items(variantes)

      orders = Spree::Order.total_orders(lineitems_per_cause.map(&:order_id))
      total = 0
      orders.each do |order|
        total = order.item_total + total
      end

      return total
  end


end
