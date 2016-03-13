class PlaylistsController < ApplicationController

  before_action :get_playlist, only: [:show, :export_as_csv]

  def index
    get_paginated_playlists
  end
    
  def show
    current_page = params[:page].to_i || 0
    tracks = @playlist.tracks(limit: 100, offset: current_page * 100)
    @tracks = WillPaginate::Collection.create(current_page + 1, 100, @playlist.total) do |pager|
      pager.replace(tracks)
    end
  end

  def export_as_csv
    playlist_export = PlaylistExport.new(@playlist)
    send_data playlist_export.as_csv, filename: "#{@playlist.name.downcase}.csv"
  end

  private

  def get_playlist
    @playlist = RSpotify::Playlist.find(params[:user_id], params[:id])
  end

  def get_paginated_playlists
    current_page = params[:page].to_i || 0

    begin
      RSpotify.raw_response = true
      playlists_response = JSON.parse(@spotify_user.playlists(limit: 20, offset: current_page * 20))
      playlists = playlists_response["items"].map { |i| RSpotify::Playlist.new(i) } 
      playlists_total = playlists_response["total"]
      @playlists = WillPaginate::Collection.create(current_page + 1, 20, playlists_total) do |pager|
        pager.replace(playlists)
      end 
    rescue Exception => e
    end

    RSpotify.raw_response = false
  end

end
