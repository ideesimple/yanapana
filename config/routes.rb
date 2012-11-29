Yanapana::Application.routes.draw do

    mount Spree::Core::Engine, :at => '/'

    Spree::Core::Engine.routes.prepend do
      namespace :admin do
        resources :artists do
        end
      end
    end
end
