Rails.application.routes.draw do
  root 'sessions#home'
  resources :projects
  resource :sessions
  resource :users

  # get '/logs' to: 'logs#create', as: 'logs_path'
  resources :logs

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
