require 'rails_helper'

RSpec.feature "User logs in" do

  scenario "successfully" do
    VCR.use_cassette("/authentication/user_logs_in_successfully") do
      visit login_path
      click_link "Login via Spotify"
      expect(current_path).to eq(playlists_path)
    end
  end

end
