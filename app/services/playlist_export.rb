require 'csv'

class PlaylistExport

  def initialize(playlist)
    @playlist = playlist
  end

  def as_csv
    tracks = get_all_tracks
    csv = CSV.generate do |csv|
      tracks.each do |track|
        csv << [track.name, track.artists.map{|artist| artist.name}.join(", "), track.album.name]
      end
    end
  end

  private

  def get_all_tracks
    limit = 100
    count = 0
    tracks = []

    while count < @playlist.total do
      tracks = (tracks << @playlist.tracks(limit: limit, offset: count)).flatten
      count = count + limit 
    end

    tracks
  end

end
