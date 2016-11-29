Rails.application.routes.draw do
  resources :projects
  root 'sessions#home'

  resource :sessions
  resource :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
