require 'rails_helper'

RSpec.feature 'User logs out' do
  scenario 'successfully' do
    VCR.use_cassette('/authentication/user_logs_out_successfully') do
      log_in
      click_link 'Logout'
      expect(current_path).to eq(root_path)
      expect(page).to have_text('Login via Spotify')
    end
  end
end
