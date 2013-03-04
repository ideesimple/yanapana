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
      end
      match "how-it-works" => "home#how_it_works", :as => :how_it_works
      match "dummy-confirm" => "home#dummy_confirm", :as => :dummy_confirm
      match "faq" => "home#faq", :as => :faq
      match "contact-us" => "home#contact_us", :as => :contact_us
      match "contact-form" => "home#contact-form", :as => :contact_form
      match "about-us" => "home#about_us", :as => :about_us
      match "dashboard" => "home#dashboard", :as => :dashboard

    end
end
