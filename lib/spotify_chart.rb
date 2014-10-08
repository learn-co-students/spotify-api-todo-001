require 'open-uri'
require 'json'

class SpotifyChart

  BASE_URL = "http://charts.spotify.com/api/tracks/most_streamed"

  def get_url(region)
    BASE_URL + "/" + region  + "/weekly/latest"
  end

  def get_json(url)
    JSON.load(open(url))
  end

  def get_first_track_info(music_hash)
    song = music_hash["tracks"][0]
    "#{song["track_name"]} by #{song["artist_name"]} from the album #{song["album_name"]}"
  end

  def most_streamed(region)
    music_hash = get_json(get_url(region))
    get_first_track_info(music_hash)
  end

end
