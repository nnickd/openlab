Rails.application.routes.draw do
  root 'sessions#home'

  post '/payments' => 'payments#create'

  post '/logs' => 'logs#create'
  # patch '/logs' => 'logs#update'
  # put '/logs' => 'logs#update'
  # delete '/logs' => 'logs#destroy'

  resource :sessions
  resource :users
  resources :projects
  resources :pools


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
