Rails.application.routes.draw do
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


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
