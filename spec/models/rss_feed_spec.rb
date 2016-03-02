require 'rails_helper'

RSpec.describe RssFeed do

  describe "validations" do
    it { should belong_to :user }
    it { should validate_presence_of :user }
    it { should validate_presence_of :spotify_playlist_id }
    it { should validate_presence_of :name }
    it { should validate_presence_of :url }
  end

end
