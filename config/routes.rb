Rails.application.routes.draw do

  get '/',             to: 'home#home'
  get '/auth/twitter', as: :login
  get '/logout',       to: 'sessions#destroy'

end
