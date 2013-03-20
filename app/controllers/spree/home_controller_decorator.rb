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
    @cause = Spree::Cause.find(:all, :conditions=>["date_start <= ? AND date_finish >= ?", date_now, date_now]).first
    @cause = Spree::Cause.where("date_start > ?", Date.today).order('date_start ASC').first unless @cause
    unless @cause.nil?
      @products_cause = @products.where(:cause_id => @cause.id).each_slice(3).to_a
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
    respond_with(@products)
  end

  def dummy_confirm
  end

  def contact_us
    if params.length > 2
      logger.debug params
      @c = Spree::ContactForm.new(:name => params["name"],:email => params["email"], :message => params["message"])
      if @c.deliver
        redirect_to root_path
      end
    end
  end


  def faq
    @faqs = Spree::Faq.find(:all)
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


  def privacy_policy
  end

  def terms_of_use
  end


  def subscribe
    email = params[:email]
    h = Hominid::API.new("747ad60d361e1376cf91b3ff8d48a814-us6")
    begin
      @response = h.list_subscribe('af0a762abc', email, {:FNAME => '', :LNAME => ''}, 'html', false, true, true, false)
    rescue
      @response = nil
    end

    respond_to do |wants|
      wants.js
    end
  end

end
