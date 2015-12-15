Rails.application.routes.draw do
  get    '/',       to: 'home#home'
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
