Rails.application.routes.draw do

  root to: "playlists#index"

  get 'auth/spotify'
  get 'login', to: "sessions#new"
  get 'auth/spotify/callback', to: 'sessions#create'
  get 'auth/spotify/token', to: 'sessions#show'
  get 'auth/spotify/logout', to: 'sessions#destroy'

  resources :playlists, only: [:index]
  resources :users, only: [] do
    resources :playlists, only: [:show] do
      get 'export_as_csv', on: :member
    end
  end

end
