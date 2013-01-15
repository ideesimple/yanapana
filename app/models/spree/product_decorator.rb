Spree::Product.class_eval do
  attr_accessible :cause_id

  belongs_to :cause

  validate :cause_id, :presence => true

  before_save :save_date

  private

  def save_date
  self.available_on = self.cause.date_start

  end

end

