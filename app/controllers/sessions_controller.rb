class SessionsController < ApplicationController

  skip_before_action :check_logged_in
  skip_before_action :get_spotify_user

  def new
  end

  def create
    spotify_user = RSpotify::User.new(request.env["omniauth.auth"])
    log_in(spotify_user)
    
    redirect_to playlists_url
  end

  def destroy
    log_out
    redirect_to login_path
  end

end
