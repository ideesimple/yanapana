class Spree::Admin::FaqsController < Spree::Admin::ResourceController

  #Se usan los metodos de la gema spree (index,new,edit,delete,show)


  def sort
    params[:positions].each do |id, index|
    Spree::Faq.where(:id => id).update_all(:position => index)
    end

    respond_to do |format|
      format.html {redirect_to admin_faqs_url}
      format.js { render :text => 'Ok' }
    end

    #params[:faq].each_with_index do |id, index|
     # Spree::Faq.update_all({position: index+1}, {id: id})
    #end
    #render nothing: true
  end

end
