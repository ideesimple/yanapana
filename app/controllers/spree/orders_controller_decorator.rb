Spree::OrdersController.class_eval do
  # Adds a new item to the order (creating a new order if none already exists)
  def populate
    @order = current_order(true)
    error_item = true
    params[:products].each do |product_id,variant_id|
      quantity = params[:quantity].to_i if !params[:quantity].is_a?(Hash)
      quantity = params[:quantity][variant_id].to_i if params[:quantity].is_a?(Hash)
      @product = Spree::Product.find(product_id)
      #if variant_id.blank?
       # logger.debug "RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR"
       # @prod = Spree::Product.find(product_id)
      #else
      item_add = @order.add_variant(Spree::Variant.find(variant_id), quantity) if quantity > 0
      if item_add.errors.any?
        flash[:error] = item_add.errors.full_messages
        error_item = false
      end
      #end
    end if params[:products]


    params[:variants].each do |variant_id, quantity|
      quantity = quantity.to_i
      @order.add_variant(Spree::Variant.find(variant_id), quantity) if quantity > 0
    end if params[:variants]

    fire_event('spree.cart.add')
    fire_event('spree.order.contents_changed')

    if error_item
      respond_with(@order) do |format|
        format.html { redirect_to cart_path}
        format.js
      end
    else
      respond_to do |format|
        format.html { redirect_to product_url(@product.permalink), :flash => { :error => flash[:error][0].to_s } }
      end
    end
  end
end
