Spree::Order.class_eval do

  def self.total_per_product(product)
    total_per_product = Spree::LineItem.where('order_id in (?) AND variant_id in (?)', Spree::Order.complete.map(&:id), product.variants_ids)
  end

end
