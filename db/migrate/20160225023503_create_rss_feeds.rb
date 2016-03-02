class CreateRssFeeds < ActiveRecord::Migration
  def change
    create_table :rss_feeds do |t|
      t.integer :user_id
      t.string :spotify_playlist_id
      t.string :name
      t.string :url

      t.timestamps null: false
    end
  end
end
