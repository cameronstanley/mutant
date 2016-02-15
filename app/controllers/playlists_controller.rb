class PlaylistsController < ApplicationController

  def index
    @playlists = @spotify_user.playlists    
  end

  def show
    @playlist = RSpotify::Playlist.find(params[:user_id], params[:id])

    current_page = params[:page].to_i || 0
    tracks = @playlist.tracks(limit: 100, offset: current_page * 100)
    @tracks = WillPaginate::Collection.create(current_page + 1, 100, @playlist.total) do |pager|
      pager.replace(tracks)
    end
  end

end
