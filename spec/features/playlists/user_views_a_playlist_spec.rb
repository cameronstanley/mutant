require 'rails_helper'

RSpec.feature "User views a playlist" do

  scenario "successfully" do
    VCR.use_cassette("/playlists/user_views_a_playlist_successfully") do
      log_in
      expect(current_path).to eq(playlists_path)
      click_link "Starred"

      expect(page).to have_text("Starred")
      expect(page.all("#tracks-table tbody tr").count).to eq(100) 
    end
  end

end
