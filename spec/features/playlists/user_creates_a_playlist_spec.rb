require 'rails_helper'

RSpec.feature "User creates a playlist" do

  scenario "successfully" do
    VCR.use_cassette("/playlists/user_creates_a_playlist_successfully") do
      log_in
      expect(current_path).to eq(playlists_path)
      click_link "New Playlist"
      expect(current_path).to eq(new_playlist_path)
      fill_in "playlist[name]", with: "Test Playlist"
      click_button "Save"
      expect(page).to have_text("Playlist successfully created.")
      expect(page).to have_text("Test Playlist")
    end
  end

end
