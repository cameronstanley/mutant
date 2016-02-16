require 'rails_helper'

RSpec.feature "User views playlists" do

  scenario "successfully" do
    VCR.use_cassette("/playlists/user_views_playlists_successfully") do
      log_in
      expect(current_path).to eq(playlists_path)
      expect(page).to have_text("Starred")
    end
  end

end
