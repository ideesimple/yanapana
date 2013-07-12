Yanapana::Application.routes.draw do

    mount Spree::Core::Engine, :at => '/'

    Spree::Core::Engine.routes.prepend do
      namespace :admin do
        resources :artists do
        end
        resources :organizations do
        end
        resources :causes do
        end
	      resources :faqs do
          collection do
            post :sort
          end
        end
	      resources :teams do
        end
        resource :review_settings 
      end
      #match '/:week' => redirect('/'), :constraints => {:week => /week-[0-9]+/ }
      match '/week-:week' => "home#index"
      match "how-it-works" => "home#how_it_works", :as => :how_it_works
      match "dummy-confirm" => "home#dummy_confirm", :as => :dummy_confirm
      match "faq" => "home#faq", :as => :faq
      match "contact-us" => "home#contact_us", :as => :contact_us
      match "about-us" => "home#about_us", :as => :about_us
      match "dashboard" => "home#dashboard", :as => :dashboard
      match "subscribe" => "home#subscribe", :as => :subscribe
      match "landing" => "home#landing", :as => :landing
      match "partnership" => "home#partnership", :as => :partnership
      match "landing-newsletter" => "home#landing_newsletter", :as => :newsletter
      match "terms-and-conditions" => "home#terms_and_conditions", :as => :terms_and_conditions
      match "terms-and-conditions-artist" => "home#terms_and_conditions_artist", :as => :terms_and_conditions_artist
      match "without-causes" => "home#without_causes", :as => :without_causes
      match "preview-cause/:id" => "home#preview_cause", :as => :preview_cause
      match "preview-product/:id" => "products#preview_product", :as => :preview_product
      match "ordermailer" => "home#ordermailer", :as => :ordermailer
      match "artistmailer" => "home#artistmailer", :as => :artistmailer
      match "shipmentmailer" => "home#shipmentmailer", :as => :shipmentmailer

      #devise_for :user, :class_name => 'Spree::User', :controllers => {:invitations => 'devise/invitations'}
    end
end
