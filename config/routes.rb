Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "welcome#home"

  get '/signup', to: "users#new"
  post '/signup', to: "users#create"

  post '/login', to: "sessions#create"
  get '/logout', to: "sessions#destroy"
  
  get '/users/(:id)', to: "users#edit" #user personal show page/onboarding

  
  resources :users

end


