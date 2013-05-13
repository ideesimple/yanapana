module Spree
  class ShipmentMailer < ActionMailer::Base
    helper 'spree/base'

    def from_address
      MailMethod.current.preferred_mails_from
    end

    def shipped_email(shipment, resend = false)
      @shipment = shipment.is_a?(Spree::Shipment) ? shipment : Spree::Shipment.find(shipment)
      subject = (resend ? "[#{t(:resend).upcase}] " : '')
      subject += "#{Spree::Config[:site_name]} #{t('shipment_mailer.shipped_email.subject')} ##{@shipment.order.number}"
						if @shipment.order.ship_address.country.name == 'United States'
								template = "shipped_email" 						
						else
								template = "shipped_email_outside"
						end
      mail(:to => @shipment.order.email,
           :from => from_address,
           :subject => subject,
											:template_path => "spree/shipment_mailer",
           :template_name => template)
						
    end
  end
end
