Rails.application.routes.draw do
  get 'images/create'

  root 'sessions#home'

  post '/logs' => 'logs#create'
  patch '/logs' => 'logs#update'
  put '/logs' => 'logs#update'
  delete '/logs' => 'logs#destroy'

  post '/payments' => 'payments#create'
  post '/pools' => 'pools#create'
  post '/images' => 'images#create'

  # post '/videos' => 'videos#create'
  # patch '/videos' => 'videos#update'
  # put '/videos' => 'videos#update'
  # delete '/videos' => 'videos#destroy'

  resources :videos, except: [:index, :show]

  resources :projects
  resource :sessions
  resource :users

end
