Rails.application.routes.draw do

  root to: "playlists#index"

  get 'login', to: "sessions#new"
  get 'auth/spotify'
  get 'auth/spotify/callback', to: 'sessions#create'
  get 'auth/spotify/logout', to: 'sessions#destroy'

  resources :playlists, only: [:index]

end
