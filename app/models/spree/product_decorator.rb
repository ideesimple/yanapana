Spree::Product.class_eval do
  attr_accessible :cause_id

  belongs_to :cause

  validate :cause_id, :presence => true
end

