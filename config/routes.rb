Rails.application.routes.draw do
  root 'sessions#home'
  resources :projects
  resource :sessions
  resource :users

  resources :logs
  resources :charges

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
