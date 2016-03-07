namespace :playlist do

  desc 'Builds playlists using tracks from RSS feeds'
  task build_from_rss_feeds: :environment do
    RssFeed.all.each do |rss_feed|
      PlaylistRssFeedBuilder.new(rss_feed).build_from_rss_feed
    end
  end

end
