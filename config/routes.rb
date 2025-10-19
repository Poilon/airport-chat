Rails.application.routes.draw do
  root "rooms#index"
  
  resources :rooms, only: [:index, :show] do
    resources :messages, only: [:create]
  end
  
  get "/airports/search", to: "airports#search"
  
  mount ActionCable.server => '/cable'
end
