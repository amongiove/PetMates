Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "welcome#home"

  get '/signup', to: "users#new"
  post '/signup', to: "users#create"
  # get '/signup/sitter', to: "users#new"
  # get '/signup/owner', to: "users#new"
  # post '/signup/sitter', to: "users#create"
  # post '/signup/owner', to: "users#create"



  resources :users

end

