Rails.application.routes.draw do

  root to: "playlists#index"

  get 'auth/spotify'
  get 'auth/spotify/callback', to: 'sessions#create'

  resources :playlists, only: [:index]

end
