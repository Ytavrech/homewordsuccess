Rails.application.routes.draw do
  # devise_for :users
  root 'articles#index'
  
  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'
  get 'sign_in', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'
  post 'sign_in', to: 'sessions#create', as: 'log_in'
  
  # resources :registrations 
  # resource :sessions
  resources :articles do
    resources :comments
  end
end
