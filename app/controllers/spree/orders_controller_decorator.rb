Spree::OrdersController.class_eval do
  # Adds a new item to the order (creating a new order if none already exists)
  def populate
    @order = current_order(true)
    error_item = true
    params[:products].each do |product_id,variant_id|
      quantity = params[:quantity].to_i if !params[:quantity].is_a?(Hash)
      quantity = params[:quantity][variant_id].to_i if params[:quantity].is_a?(Hash)
      @product = Spree::Product.find(product_id)
    if variant_id.empty?
        error_item = false
        flash[:error] = "Please select a size before adding to cart!"
        @error = "Select a Size"
    else
      @item_add = @order.add_variant(Spree::Variant.find(variant_id), quantity) if quantity > 0
        if @item_add.errors.any?
          flash[:error] = @item_add.errors.full_messages
          error_item = false
        end
    end
    end if params[:products]



    params[:variants].each do |variant_id, quantity|
      quantity = quantity.to_i
      @item_add = @order.add_variant(Spree::Variant.find(variant_id), quantity) if quantity > 0
      if @item_add.errors.any?
        flash[:error] = @item_add.errors.full_messages
        error_item = false
      end
    end if params[:variants]

    fire_event('spree.cart.add')
    fire_event('spree.order.contents_changed')

    if error_item
      respond_with(@order) do |format|
        format.html { redirect_to root_path, :flash => { :notice => "Success"}}
        format.js
      end
    else
      logger.debug "aaaaaaaaaaaaaaaaaaaaaaa"
      respond_to do |format|
        format.html { redirect_to product_path(@product.permalink), :error => flash[:error][0].to_s }
        format.js
      end
    end
  end
end
