Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :owners, only: [:create]
  post '/section', to: 'sections#create'
  get '/section', to: 'sections#this_section'
  
  post '/section/:id/new_tank', to: 'tanks#create'
  get '/section/:id/tanks', to: 'tanks#these_tanks'
  patch '/section/:id/tanks/:tank_id', to: 'tanks#this_tank'
  get '/tanks', to: 'tanks#index'

  get '/lot/:id', to: 'lots#this_lot'
  # get '/section/:id/lots', to: 'lots#these_lots'
  get '/lots', to: 'lots#these_lots'
  post '/lots/:tank_id', to: 'lots#create'
  patch '/lots/:id/tanks/:tank_id', to: 'lots#move_lot'

  post '/work_order', to: 'work_orders#create'
  get '/work_orders', to: 'work_orders#index'
  patch '/work_orders/:id', to: 'work_orders#edit'

  post '/login', to: 'auth#create'
  get '/login', to: 'owners#token_authenticate'
  # post '/profile', to: 'users#profile'
  post '/signup', to: 'owners#create'
end
