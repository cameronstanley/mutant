class User < ActiveRecord::Base

  serialize :spotify_user, Hash

end
