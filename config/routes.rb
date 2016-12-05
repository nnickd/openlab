Rails.application.routes.draw do
  get 'images/create'

  root 'sessions#home'

  post '/logs' => 'logs#create'
  patch '/logs' => 'logs#update'
  put '/logs' => 'logs#update'
  delete '/logs' => 'logs#destroy'

  post '/payments' => 'payments#create'
  post '/pools' => 'pools#create'

  resources :projects
  resource :sessions
  resource :users

end
