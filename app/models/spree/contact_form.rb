class Spree::ContactForm < MailForm::Base
  attribute :name,  :validate => true
  attribute :email, :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :suggestion
  attribute :phone
  attribute :message

  SUGGESTION = ['duda','quiero vender']

  class << self
    SUGGESTION.each do |suggestion|
      define_method "sugg_#{suggestion}" do
        subject
      end
    end
  end


  def headers
    {
      :subject => "My Contact Form",
      :to => "roberto.laraesp@gmail.com",
      :from => %("#{name}" <#{email}>)
    }
  end

end
