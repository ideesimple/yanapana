Spree::OrdersController.class_eval do
  # Adds a new item to the order (creating a new order if none already exists)
  def populate
    @order = current_order(true)

    params[:products].each do |product_id,variant_id|
      quantity = params[:quantity].to_i if !params[:quantity].is_a?(Hash)
      quantity = params[:quantity][variant_id].to_i if params[:quantity].is_a?(Hash)
      @order.add_variant(Spree::Variant.find(variant_id), quantity) if quantity > 0
    end if params[:products]

    params[:variants].each do |variant_id, quantity|
      quantity = quantity.to_i
      @order.add_variant(Spree::Variant.find(variant_id), quantity) if quantity > 0
    if @order.add_variant == false
      @mostrar= "prueba con error"
    end
    end if params[:variants]

    fire_event('spree.cart.add')
    fire_event('spree.order.contents_changed')
    respond_with(@order) do |format|
      format.html { redirect_to cart_path}
      format.js
    end
  end
end
