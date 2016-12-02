Rails.application.routes.draw do
  root 'sessions#home'
  
  post '/payments' => 'payments#create'
  post '/logs' => 'logs#create'

  resource :sessions
  resource :users
  resources :projects


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
