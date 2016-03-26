class Api::PlaylistsController < ApplicationController

  before_action :get_playlist, only: [:show, :destroy, :export_as_csv]

  def index
    get_paginated_playlists
    render json: @playlists
  end
    
  def show
    current_page = params[:page].to_i || 0
    tracks = @playlist.tracks(limit: 100, offset: current_page * 100)
    @tracks = WillPaginate::Collection.create(current_page + 1, 100, @playlist.total) do |pager|
      pager.replace(tracks)
    end
  end

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = Playlist.new(playlist_params)

    if @playlist.valid?
      begin
        created_playlist = @spotify_user.create_playlist!(@playlist.name)
        flash[:success] = "Playlist successfully created."
        redirect_to user_playlist_path(user_id: created_playlist.owner.id, id: created_playlist.id)
      rescue Exception => e
        flash.now[:error] = "Error occurred creating playlist: #{e.message}"
        render :new
      end
    else
      flash.now[:error] = @playlist.errors.to_a.join ", "
      render :new
    end
  end

  def destroy
    @spotify_user.unfollow(@playlist)
    flash[:success] = "Playlist successfully unfollowed."
    redirect_to playlists_path
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

  def playlist_params
    params.require(:playlist).permit(:name)
  end

end
