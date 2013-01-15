Spree::HomeController.class_eval do

  def index
    @searcher = Spree::Config.searcher_class.new(params)
    @searcher.current_user = try_spree_current_user
    @products = @searcher.retrieve_products
    respond_with(@products)
  end

  def memberships
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
