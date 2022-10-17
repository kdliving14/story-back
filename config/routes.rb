Rails.application.routes.draw do
  resources :inventories, only: [:index, :create]
  resources :items, only: [:index]
  resources :userchoices, only: [:index, :show, :create]
  resources :userstories, only: [:index, :show, :create, :update, :destroy]
  resources :choices, only: [:index, :show]
  resources :events, only: [:index, :show]
  resources :stories, only: [:index]
  resources :users, only: [:show, :create, :update, :destroy]

  post "/login", to: "sessions#create" 
  delete "/logout", to: "sessions#destroy"

  patch "/chosen", to: "userstories#choose"

  get "/me", to: "users#show"

  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }
end
