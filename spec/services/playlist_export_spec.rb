require 'rails_helper'

RSpec.describe PlaylistExport do
  
  describe "#as_csv" do
    let(:track1) { RSpotify::Track.find("4U21h8AueaOxQ30agnDk6R") }
    let(:track2) { RSpotify::Track.find("5wl4ap1sAJjZgtNYV3Dwbi") }
    let(:playlist_export) { 
      playlist_export = PlaylistExport.new(nil) 
      allow(playlist_export).to receive(:get_all_tracks).and_return([track1, track2])
      playlist_export
    }

    subject { playlist_export.as_csv }

    it "retrieves a CSV track listing for the playlist" do
      VCR.use_cassette("services/playlist_export/as_csv") do
        expect(subject).to eq("Enjoy the Silence - Remastered,Depeche Mode,Violator\nPolicy of Truth - Remastered,Depeche Mode,Violator\n") 
      end
    end
  end

end
