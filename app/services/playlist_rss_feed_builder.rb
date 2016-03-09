class PlaylistRssFeedBuilder

  def initialize(rss_feed)
    @rss_feed = rss_feed
    @spotify_user = RSpotify::User.new(rss_feed.user.spotify_user)
    @playlist = @spotify_user.playlists.select {|playlist| playlist.id == rss_feed.spotify_playlist_id}.first
  end

  def build_from_rss_feed
    feed = Feedjira::Feed.fetch_and_parse(@rss_feed.url)
    feed.entries.each do |entry|
      search_query = entry.title.gsub(/\:/, '')
      found_tracks = RSpotify::Track.search(search_query)
      
      if found_tracks.any?
        track = found_tracks.first

        @playlist.add_tracks!([track])
        puts "Adding track #{track.name} to #{@playlist.name} playlist."
      end
    end
  end

end
