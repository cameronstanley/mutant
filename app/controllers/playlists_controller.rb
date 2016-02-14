class PlaylistsController < ApplicationController

  def index
    @playlists = @spotify_user.playlists    
  end

  def show
    @playlist = RSpotify::Playlist.find(params[:user_id], params[:id])
  end

end
