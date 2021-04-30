Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "welcome#home"
  get '/signup', to: "users#type_selection"
  post '/signup', to: "users#new"


  resources :users

end
