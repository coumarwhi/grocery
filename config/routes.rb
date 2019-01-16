Rails.application.routes.draw do
  devise_for :users
  
  resources :grocery_lists do
    resources :grocery_items do
      member do
        patch :complete
      end
    end
  end 

  root "grocery_lists#index"

  mount ActionCable.server => '/cable'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
