Rails.application.routes.draw do
  root 'sessions#home'

  post '/payments' => 'payments#create'
  post '/pools' => 'pools#create'


  resources :videos, except: [:show, :index]
  resource :sessions
  resource :users

  resources :projects, shallow: true do
    resources :categories_projects
    resources :images
    resources :logs
    resources :contents
    resources :categories
  end

end
