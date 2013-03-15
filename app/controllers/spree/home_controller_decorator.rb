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
    end
    respond_with(@products)
  end

  def dummy_confirm
  end

  def contact_us
    if params.length > 2
      logger.debug params
      logger.debug "PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP"
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
    logger.debug "AAAAAAAAAAAAAAAAAAAAAAAAAAA"
  end


  def privacy_policy
  end

  def terms_of_use
  end
end
