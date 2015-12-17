Rails.application.routes.draw do

  root to: 'feed#index'
  post '/', to: 'feed#create', as: :search
  get '/auth/instagram', as: :login
  get '/auth/instagram/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: :logout
  get '/:username', to: 'dashboard#show', as: :dashboard
end
