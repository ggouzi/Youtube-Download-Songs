# Playlist downloader, calls SongDownloader for each song in playlist
class PlaylistDownloader < Downloader
  LINKS_CSS_PATH = '#pl-video-table tr td a'.freeze

  def self.playlist?(url)
    url.include? YOUTUBE_BASE_URL + '/playlist?list='
  end

  def initialize(url, counter, settings)
    @url = url
    @urls = urls
    @name = parse_name(@url.scrapify[:title]) + '/'
    @counter = counter.dup
    @counter.playlist_current = 1
    @counter.playlist_total = @urls.size
    @settings = settings.dup
    @settings.subfolder = @name
  end

  def urls
    html = Nokogiri::HTML(open(url).read)
    html.css(LINKS_CSS_PATH)
        .select { |link| link.attr('href').include?('watch') }
        .map { |link| YOUTUBE_HTTPS_URL + link.attr('href') }
        .uniq
  rescue
    SimpleLogger.couldnt_fetch_playlist_url
    []
  end

  def self.download(url, counter, settings)
    playlist = new(url, counter, settings)
    playlist.urls.each do |song_url|
      SongDownloader.download(song_url, playlist.counter, playlist.settings)
      playlist.counter.playlist_current += 1
    end
  end
end
