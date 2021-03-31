Rails.application.routes.draw do
  get '/top', to: 'home#top'
  resources :posts
  root to: 'home#top'
end