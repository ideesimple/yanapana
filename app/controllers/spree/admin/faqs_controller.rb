class Spree::Admin::FaqsController < Spree::Admin::ResourceController

  #Se usan los metodos de la gema spree (index,new,edit,delete,show)


  def sort
    params[:faq].each_with_index do |id, index|
      Spree::Faq.update_all({position: index+1}, {id: id})
    end
    render nothing: true
  end

end
