class User < ActiveRecord::Base

  has_many :rss_feeds

  serialize :spotify_user, Hash

end
