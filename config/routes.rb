Rails.application.routes.draw do
  devise_for :users
  
  resources :grocery_lists do
    resources :grocery_items
  end 

  root "grocery_lists#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
