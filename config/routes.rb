Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :owners, only: [:create]
  post '/winery', to: 'winery#create'
  get '/winery', to: 'winery#this_winery'
  post '/winery/:id/new_tank', to: 'tanks#create'
  get '/winery/:id/tanks', to: 'tanks#these_tanks'
  patch '/winery/:id/tanks/:tank_id', to: 'tanks#this_tank'
  post '/login', to: 'auth#create'
  get '/login', to: 'owners#token_authenticate'
  # post '/profile', to: 'users#profile'
  post '/signup', to: 'owners#create'
end
