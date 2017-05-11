Rails.application.routes.draw do
  root to: 'home#index'
  get '/auth/github', as: :github_login
  get '/auth/:provider/callback', to: 'sessions#create'

  resources :users, only: [:show]
end
