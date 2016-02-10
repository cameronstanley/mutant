class SessionsController < ApplicationController

  skip_before_action :check_logged_in
  skip_before_action :get_spotify_user

  def create
    spotify_user = RSpotify::User.new(request.env["omniauth.auth"])
    session[:spotify_user] = spotify_user
    
    redirect_to playlists_path
  end

end
