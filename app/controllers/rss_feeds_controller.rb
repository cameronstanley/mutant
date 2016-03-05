class RssFeedsController < ApplicationController

  before_action :get_playlist
  before_action :get_rss_feed, only: [:edit, :update, :destroy]
  before_action :check_playlist_ownership

  def index
    @rss_feeds = RssFeed.where(user_id: current_user.id, spotify_playlist_id: params[:playlist_id])
  end

  def new
    @rss_feed = RssFeed.new
  end

  def create
    @rss_feed = RssFeed.new(rss_feed_params)
    @rss_feed.user_id = current_user.id
    @rss_feed.spotify_playlist_id = @playlist.id

    if @rss_feed.save
      flash[:success] = "RSS feed successfully added."
      redirect_to user_playlist_rss_feeds_path(user_id: @playlist.owner.id, playlist_id: @playlist.id)
    else
      flash.now[:error] = @rss_feed.errors.to_a.join ", "
      render "new"
    end
  end

  def edit
  end

  def update
    if @rss_feed.update(rss_feed_params)
      flash[:success] = "RSS feed successfully updated."
      redirect_to user_playlist_rss_feeds_path(user_id: @playlist.owner.id, playlist_id: @playlist.id)
    else
      flash.now[:error] = @rss_feed.errors.to_a.join ", "
      render "new"
    end
  end

  def destroy
    @rss_feed.destroy
    flash[:success] = "RSS feed successfully removed."
    redirect_to user_playlist_rss_feeds_path(user_id: @playlist.owner.id, playlist_id: @playlist.id)
  end

  private

  def get_playlist
    @playlist = RSpotify::Playlist.find(params[:user_id], params[:playlist_id])
  end

  def get_rss_feed
    @rss_feed = RssFeed.find_by(user_id: current_user.id, spotify_playlist_id: params[:playlist_id], id: params[:id])
  end

  def check_playlist_ownership
    if current_user.spotify_id != @playlist.owner.id
      flash[:error] = "You must be the owner of a playlist to build from an RSS feed."
      redirect_to user_playlist_path(user_id: @playlist.owner.id, id: @playlist.id)
    end
  end

  def rss_feed_params
    params.require(:rss_feed).permit(:name, :url)
  end

end
