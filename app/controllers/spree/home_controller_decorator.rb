Spree::HomeController.class_eval do

  before_filter :artist_account, :only => :dashboard

  def artist_account
    @artist = Spree::Artist.find_by_email(current_user.email)
  end

  def index
    @searcher = Spree::Config.searcher_class.new(params)
    @searcher.current_user = try_spree_current_user
    @products = @searcher.retrieve_products
    date_now = Date.today
    @cause = Spree::Cause.where("date_start <= ? AND date_finish >= ?", Time.zone.now, Time.zone.now).order('date_start ASC').first
    unless @cause.nil?
      @products_cause = @products.where(:cause_id => @cause.id).order("created_at ASC").each_slice(3).to_a
      #Arista asociado a esa causa
      @artist = Spree::Artist.find_by_id(@cause.artist)
      @products_per_cause = @products.where(:cause_id=>@cause.id)
      variantes = []
      @products_per_cause.each do |prod|
        variantes << prod.variants_ids
      end
      @lineitems_per_cause = Spree::Order.total_line_items(variantes)

      @items_per_cause = Spree::Order.total_items(variantes)

      #@orders = Spree::Order.total_orders(@lineitems_per_cause.map(&:order_id))

      @total = 0
      @total = @items_per_cause * 8
      #@orders.each do |order|
      #  @total = order.item_total + @total
      #end
    end
    unless @cause.nil?
    respond_with(@products)
    else
    redirect_to without_causes_path
    end
  end

  def current_cause
  end

  def dummy_confirm
  end

  def contact_us
    if params.length > 2
      logger.debug params
      @c = Spree::ContactForm.new(:name => params["name"],:email => params["email"], :message => params["message"],:suggestion=> params["suggestion"])
      if @c.deliver
        redirect_to contact_us_path + "#leavemessage", :alert => "i"
      end
    end
  end


  def faq
    @faqs = Spree::Faq.order("position ASC").all
  end

  def about_us
    @teams = Spree::Team.find(:all).each_slice(4).to_a
  end

  def dashboard
    @causes = Spree::Cause.where(:artist_id => @artist.id)
    @total_per_cause = 0
    variantes = []
    #Recorrer las causas
    @causes.each do |cause|
      contador = cause.products.count
      @total_per_cause = contador + @total_per_cause
      cause.products.each do |prod|
        variantes << prod.variants_ids
      end #Termina la iteracion de productos por causa
    end #Termina la iteracion de causas
    @lineitems_distinct_order = Spree::Order.total_line_items(variantes)
    @orders_per_artist = Spree::Order.total_orders(@lineitems_distinct_order.map(&:order_id))
    @sales = @orders_per_artist.sum(:total)
  end

  def dashboard_organization
  end
  
  def privacy_policy
  end

  def terms_and_conditions
  end

  def terms_and_conditions_artist
  end

  def without_causes
    render :layout => "application"
  end

  def subscribe
    email = params[:email]
    h = Hominid::API.new('6c3bc75008800ae5fc53277d0bfb918d-us5')
    @prueba = h.lists
    begin
      @response = h.list_subscribe('5ec394c1ce', email, {:FNAME => '', :LNAME => ''}, 'html', false, true, true, true)
    rescue
      @response = nil
    end

    respond_to do |wants|
      wants.js
    end
  end

  def landing_newsletter
    email = params[:email]
    h = Hominid::API.new('6c3bc75008800ae5fc53277d0bfb918d-us5')
    @prueba = h.lists
    begin
      @response = h.list_subscribe('395d0d08cd', email, {:FNAME => '', :LNAME => ''}, 'html', false, true, true, true)
    rescue
      @response = nil
    end

    respond_to do |wants|
      wants.js
    end
  end

  def landing
    render :layout => "application"
  end

  def how_it_works
  end

  def partnership
  end


  def preview_cause
    @searcher = Spree::Config.searcher_class.new(params)
    @searcher.current_user = try_spree_current_user
    @products = @searcher.retrieve_products
    @cause = Spree::Cause.find_by_id(params[:id])
    unless @cause.nil?
      @products_cause = @products.where(:cause_id => @cause.id).order("created_at ASC").each_slice(3).to_a
      #Arista asociado a esa causa
      @artist = Spree::Artist.find_by_id(@cause.artist)
      @products_per_cause = @products.where(:cause_id=>@cause.id)
      variantes = []
      @products_per_cause.each do |prod|
        variantes << prod.variants_ids
      end
      @lineitems_per_cause = Spree::Order.total_line_items(variantes)
      @orders = Spree::Order.total_orders(@lineitems_per_cause.map(&:order_id))
      @total = 0
      @orders.each do |order|
        @total = order.item_total + @total
      end
    end
    unless @cause.nil?
    respond_with(@products)
    else
    redirect_to landing_path
    end
  end

  def ordermailer
    render :layout => "application"
  end

  def artistmailer
    render :layout => "application"
  end

  def shipmentmailer
    render :layout => "application"
  end

end
