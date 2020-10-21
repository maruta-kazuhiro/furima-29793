Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  root to: "items#index"
  
  resources :users
  get 'items/search'
  resources :items do 
    resources :orders
  end
  
end