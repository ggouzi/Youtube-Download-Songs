# Song downloader class, uses YoutubeDL to download only the audio
class SongDownloader < Downloader
  def initialize(url, settings, counter)
    @url = parse_url(url)
    @counter = counter.dup
    @settings = settings.dup
    @name = parse_name(@url.scrapify[:title])
  end

  def self.download(url, counter, settings, number_of_tries = 1)
    song = new(url, settings, counter)
    SimpleLogger.progress(song, song.counter)
    return SimpleLogger.maximum_number_of_tries if number_of_tries > MAXIMUM_NUMBER_OF_TRIES
    song.download
  rescue
    SimpleLogger.retry(song.url, song.name, number_of_tries)
    download(url, counter, settings, number_of_tries + 1)
  end

  def download
    SimpleLogger.downloading(self)
    YoutubeDL.download url, format: 'm4a', output: settings.filepath(name)
    SimpleLogger.finished_downloading
  end

  def parse_url(input = nil)
    url = input.include?('youtu') ? input.strip : find_youtube_video(input)
    url = url.slice(0, url.index('&')) if url.include? '&'
    url
  end

  def find_youtube_video(name)
    search_url = YOUTUBE_SEARCH_URL + URI.encode(name)
    results = open(search_url).read

    return YOUTUBE_WATCH_URL + Regexp.last_match(1) if results =~ /watch\?v=([-\w_]+)/
    puts SimpleLogger.found_no_results(@url)
  end
end
