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

  def cause_now
    @cause = Spree::Cause.where("date_start <= ? AND date_finish >= ?", Time.zone.now, Time.zone.now).order('date_start ASC').first
    return @cause
  end
end
