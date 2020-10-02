Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :users
  resources :items do 
    resources :orders do
      resources :destination
    end
  end
end