Spree::HomeController.class_eval do

  def index
    @searcher = Spree::Config.searcher_class.new(params)
    @searcher.current_user = try_spree_current_user
    @products = @searcher.retrieve_products
    date_now = Date.today
    @cause = Spree::Cause.find(:all, :conditions=>["date_start <= ? AND date_finish >= ?", date_now, date_now]).first
    unless @cause.nil?
    logger.debug @cause
    @products_cause = @products.where(:cause_id => @cause.id).each_slice(3).to_a
    @artist = Spree::Artist.find_by_id(@cause.artist)
    end
    respond_with(@products)
  end

  def dummy_confirm
  end

  def contact_us
    unless params.blank?
      @c = Spree::ContactForm.new(:name => params["name"],:email => params["email"], :message => params["message"])
      if @c.deliver
        redirect_to root_path
      end
    end
  end

  def faq
  end

  def about_us
  end

  def dashboard
  end

  def privacy_policy
  end

  def terms_of_use
  end
end
