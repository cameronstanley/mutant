Rails.application.routes.draw do
  get 'auth/spotify/callback', to: 'sessions#create'
end
