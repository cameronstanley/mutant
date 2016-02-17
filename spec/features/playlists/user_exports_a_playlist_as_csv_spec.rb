require 'rails_helper'

RSpec.feature "User exports a playlist as CSV" do

  scenario "successfully" do
    VCR.use_cassette("/playlists/user_exports_a_playlist_as_csv_successfully") do
      log_in
      expect(current_path).to eq(playlists_path)
      click_link "Starred"

      expect(page).to have_text("Starred")
      click_link "Export as CSV"
      expect(page.response_headers["Content-Disposition"]).to include("filename=\"starred.csv\"")
    end
  end

end
