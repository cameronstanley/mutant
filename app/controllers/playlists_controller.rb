class PlaylistsController < ApplicationController

  def index
    @playlists = @spotify_user.playlists    
  end

end
