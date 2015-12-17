Rails.application.routes.draw do
  get '/',                      to: 'welcome#index'
  get '/home',                  to: 'home#home'
  get '/auth/twitter',          as: :login
  get '/auth/twitter/callback', to: 'sessions#create'
  get '/logout',                to: 'sessions#destroy'
  resources :welcome, only: [:index]
  resources :tweets, only: [:create, :update]


end
