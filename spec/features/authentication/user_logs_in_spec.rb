require 'rails_helper'

RSpec.feature 'User logs in' do
  scenario 'successfully' do
    VCR.use_cassette("/authentication/user_logs_in_successfully") do
      visit root_path
      click_link 'Login via Spotify'
      expect(current_path).to eq(root_path)
      expect(page).to have_text 'Signed in as'
    end
  end
end
