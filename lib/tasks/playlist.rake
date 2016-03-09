namespace :playlist do

  desc 'Builds playlists using tracks parsed from RSS feeds'
  task build_from_rss_feeds: :environment do
    RssFeed.all.each do |rss_feed|
      begin
        PlaylistRssFeedBuilder.new(rss_feed).build_from_rss_feed
      rescue Exception => e
        puts "Error building playlist for RSS Feed id=#{rss_feed.id}: #{e.message}"
        puts e.backtrace
      end
    end
  end

end
