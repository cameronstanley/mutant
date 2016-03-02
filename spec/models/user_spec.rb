require 'rails_helper'

RSpec.describe User do

  describe "validations" do
    it { should have_many :rss_feeds }
    it { should serialize(:spotify_user).as(Hash) }
  end

end
