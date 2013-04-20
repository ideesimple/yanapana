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
        end
	      resources :teams do
        end
      end
      match '/:week' => redirect('/'), :constraints => {:week => /week-[0-9]+/ }
      #match '/:week' => "home#current_cause", :constraints => {:week => /week-[0-9]+/ }
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


      #devise_for :user, :class_name => 'Spree::User', :controllers => {:invitations => 'devise/invitations'}
    end
end
