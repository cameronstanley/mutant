class RssFeed < ActiveRecord::Base

  belongs_to :user

  validates_presence_of :user
  validates_presence_of :spotify_playlist_id
  validates_presence_of :name
  validates_presence_of :url 

end
