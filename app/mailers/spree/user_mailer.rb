class Spree::UserMailer < ActionMailer::Base
<<<<<<< HEAD
  def reset_password_instructions(user)
  @edit_password_reset_url = spree.edit_user_password_url(:reset_password_token => user.reset_password_token)

  mail(:to => user.email,
       :subject => Spree::Config[:site_name] + ' ' + I18n.t(:password_reset_instructions))
  end

  def invitation_instructions(record)
    @resource = record
     mail(:to => record.email,
                  :subject => Spree::Config[:site_name],
                  :template_path => "devise/mailer",
                  :template_name => "invitation_instructions")
  end
=======
  #def invitation_instructions(record)
   # devise_mail(record, :invitation_instructions)
  #end


  def reset_password_instructions(user)
    @edit_password_reset_url = spree.edit_user_password_url(:reset_password_token => user.reset_password_token)

    mail(:to => user.email,
         :subject => Spree::Config[:site_name] + ' ' + I18n.t(:password_reset_instructions))
  end


  
>>>>>>> 02b01325a6e0e682c5c992a5bf57d5ccba67e3dd
end
