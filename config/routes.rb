Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :owners, only: [:create]
  post '/login', to: 'auth#create'
  post '/profile', to: 'users#profile'
end
