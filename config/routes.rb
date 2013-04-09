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
      match "how-it-works" => "home#how_it_works", :as => :how_it_works
      match "dummy-confirm" => "home#dummy_confirm", :as => :dummy_confirm
      match "faq" => "home#faq", :as => :faq
      match "contact-us" => "home#contact_us", :as => :contact_us
      match "about-us" => "home#about_us", :as => :about_us
      match "dashboard" => "home#dashboard", :as => :dashboard
      match "subscribe" => "home#subscribe", :as => :subscribe
      match "landing" => "home#landing", :as => :landing
      match "partnership" => "home#partnership", :as => :partnership

      #devise_for :user, :class_name => 'Spree::User', :controllers => {:invitations => 'devise/invitations'}
    end
end
