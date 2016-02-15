require 'rails_helper'

RSpec.feature "User logs out" do

  scenario "successfully" do
    VCR.use_cassette("/authentication/user_logs_out_successfully") do
      log_in
      expect(current_path).to eq(playlists_path)
      click_link "Logout"
    end
  end

end
