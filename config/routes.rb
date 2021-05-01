Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "welcome#home"#, to: "sessions#new"
  
  post '/login', to: "sessions#create"

  get '/signup', to: "users#new"
  post '/signup', to: "users#create"
  
  get '/users/(:id)', to: "users#edit"

  # get '/login', to: "sessions#new"
  # delete '/logout', to: "sessions#destroy"

  resources :users
  #user show

end


