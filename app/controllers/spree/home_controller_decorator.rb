Spree::HomeController.class_eval do

  def index
    @searcher = Spree::Config.searcher_class.new(params)
    @searcher.current_user = try_spree_current_user
    @products = @searcher.retrieve_products
    @cause = Spree::Cause.find_by_status(true)
    unless @cause.nil?
    @products_cause = @products.where(:cause_id => @cause.id).each_slice(3).to_a
    @artist = Spree::Artist.find_by_id(@cause.artist)
    end
    respond_with(@products)
  end

  def dummy_confirm
  end

  def contact_us
  end

  def faq
  end

  def about_us
  end

  def how_it_works
  end

  def privacy_policy
  end

  def terms_of_use
  end
end
