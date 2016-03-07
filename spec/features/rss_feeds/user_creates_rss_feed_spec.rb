require 'rails_helper'

RSpec.feature "User creates an RSS feed" do
      
  scenario "successfully" do
    VCR.use_cassette("/rss_feeds/user_creates_an_rss_feed_successfully") do
      log_in
      expect(current_path).to eq(playlists_path)
      click_link "Starred"
      click_link "Build from RSS"
      click_link "Add RSS Feed"
      fill_in "rss_feed[name]", with: "Pitchfork"
      fill_in "rss_feed[url]", with: "http://pitchfork.com/rss/reviews/albums/"
      click_button "Save"

      rss_feed = RssFeed.last
      expect(rss_feed.name).to eq("Pitchfork")
      expect(rss_feed.url).to eq("http://pitchfork.com/rss/reviews/albums/")
    end 
  end

end
