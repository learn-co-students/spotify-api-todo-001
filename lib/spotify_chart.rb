require 'open-uri'
require 'json'

class SpotifyChart

  BASE_URL = "http://charts.spotify.com/api/tracks/"

  def get_url(version, region)
    BASE_URL + version + "/" + region  + "/weekly/latest"
  end

  def get_json(url)
    JSON.load(open(url))
  end

  def get_first_track_info(music_hash)
    song = music_hash["tracks"][0]
    "#{song["track_name"]} by #{song["artist_name"]} from the album #{song["album_name"]}"
  end

  def most_streamed(region)
    music_hash = get_json(get_url("most_streamed", region))
    get_first_track_info(music_hash)
  end

  def most_shared(region)
    music_hash = get_json(get_url("most_shared", region))
    get_first_track_info(music_hash)
  end

end
