Rails.application.routes.draw do

  root to: 'feed#index'
  post '/', to: 'feed#create', as: :search
  get '/results', to: 'feed#show', as: :results
  post '/', to: 'feed#like_post', as: :like_post
  post '/', to: 'feed#unlike_post', as: :unlike_post
  get '/auth/instagram', as: :login
  get '/auth/instagram/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: :logout
  get '/:username', to: 'dashboard#show', as: :dashboard
end
