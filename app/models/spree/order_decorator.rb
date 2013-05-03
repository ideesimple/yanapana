Spree::Order.class_eval do
  def self.total_per_product(product)
    total_per_product = Spree::LineItem.where('order_id in (?) AND variant_id in (?)', Spree::Order.complete.map(&:id), product.variants_ids)
  end

  def self.total_orders(orders_ids)
    total_orders = Spree::Order.where('id in (?)', orders_ids)
  end

  def self.total_line_items(variantes)
    variantes = variantes.flatten
    Spree::LineItem.where('order_id in (?) AND variant_id in (?)', Spree::Order.complete.map(&:id), variantes).select('distinct order_id')
  end

  def self.total_items(variantes)
    variantes = variantes.flatten
    Spree::LineItem.where('order_id in (?) AND variant_id in (?)', Spree::Order.complete.map(&:id), variantes).sum(&:quantity)
  end

end
