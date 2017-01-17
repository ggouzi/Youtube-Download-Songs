# Base downloader class intherited by SongDownloader and PlaylistDownloader
class Downloader
  extend Memoist

  attr_accessor :url, :name, :counter, :settings

  YOUTUBE_BASE_URL = 'youtube.com'.freeze
  YOUTUBE_HTTPS_URL = "https://www.#{YOUTUBE_BASE_URL}".freeze
  YOUTUBE_SEARCH_URL = "#{YOUTUBE_HTTPS_URL}/results?search_query=".freeze
  YOUTUBE_WATCH_URL = "#{YOUTUBE_HTTPS_URL}/watch?v=".freeze
  MAXIMUM_NUMBER_OF_TRIES = 3

  def parse_name(title)
    title = title.slice(0, title.rindex('-')) if title.include? '-'
    title.strip
  end
end
