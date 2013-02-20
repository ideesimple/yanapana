class ContactForm < MailForm::Base
  attribute :name,  :validate => true
  attribute :email, :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :subject, :validate => true
  attribute :phone
  attribute :message

  SUBJECT = ['duda','quiero vender']

  class << self
    SUBJECT.each do |subject|
      define_method "subject_#{subject}" do
        subject
      end
    end
  end


  def headers
    {
      :subject => "My Contact Form",
      :to => "titogo@gmail.com",
      :from => %("#{name}" <#{email}>)
    }
  end

end
