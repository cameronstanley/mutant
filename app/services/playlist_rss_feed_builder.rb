class PlaylistRssFeedBuilder

  def initialize(rss_feed)
    @rss_feed = rss_feed
    @playlist = RSpotify::Playlist.find(rss_feed.user.spotify_id, rss_feed.spotify_playlist_id)
  end

  def build_from_rss_feed
    feed = Feedjira::Feed.fetch_and_parse(@rss_feed.url)
    feed.entries.each do |entry|
      search_query = entry.title.gsub(/\:/, '')
    end
  end

end
