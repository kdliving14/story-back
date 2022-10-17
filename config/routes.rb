Rails.application.routes.draw do
  resources :inventories, only: [:index, :create]
  resources :items
  resources :userchoices
  resources :userstories
  resources :choices, only: [:index, :show]
  resources :events
  resources :stories
  resources :users

  post "/login", to: "sessions#create" 
  delete "/logout", to: "sessions#destroy"

  patch "/chosen", to: "userstories#choose"

  get "/me", to: "users#show"

  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }
end
