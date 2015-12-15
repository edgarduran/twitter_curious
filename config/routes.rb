Rails.application.routes.draw do

  get '/',                      to: 'home#home'
  get '/auth/twitter',          as: :login
  get '/auth/twitter/callback', to: 'sessions#create'
  get '/logout',                to: 'sessions#destroy'

end
