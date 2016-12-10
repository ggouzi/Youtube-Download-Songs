#!/usr/bin/env ruby

require 'rubygems'
require 'bundler/setup'
require 'scrapifier'
require 'youtube-dl.rb'
require 'open-uri'

DOWNLOAD_DIRECTORY = '~/Music/'.freeze
YOUTUBE_URL = 'https://www.youtube.com/watch?v='.freeze
YOUTUBE_SEARCH_URL = 'https://www.youtube.com/results?search_query='.freeze

def download(url, name)
  location = DOWNLOAD_DIRECTORY + name.strip.tr('/', '|') + '.m4a'
  download_options = {
    format: 'm4a',
    output: location
  }
  puts "DOWNLOADING #{url}/#{name}"
  YoutubeDL.download url, download_options
end

def parse_url(input = nil)
  url = input.include?('youtube') ? input.strip : find_youtube_video(input)
  url = url.slice(0, url.index('&')) if url.include? '&'
  url
end

def find_youtube_video(name)
  search_url = YOUTUBE_SEARCH_URL + URI.encode(name)
  results = open(search_url).read

  return YOUTUBE_URL + Regexp.last_match(1) if results =~ /watch\?v=([-\w_]+)/
  puts "DIDNT FIND ANY RESULTS FOR #{url}"
end

def parse_title(title)
  title = title.slice(0, title.rindex('-')) if title.include? '-'
  title
end

def launch_download(url, n, total)
  metadata = url.scrapify
  title = parse_title metadata[:title]
  puts "#{n}/#{total} - #{title}"
  download(url, title)
rescue OpenURI::HTTPError
  puts "COULDNT DOWNLOAD #{url}"
end

if ARGV.length != 1 || ARGV[0] == '-h' || ARGV[0] == '--help'
  puts 'You should pass one parameter: The song name/youtube url or the file containing all youtube songs/urls to download'
  puts 'make sure youve run `bundle install` first to download dependencies and then one of:'
  puts 'Example1: bundle exec download_m4a.rb test.txt'
  puts 'Example2: bundle exec download_m4a.rb "https://www.youtube.com/watch?v=bM7SZ5SBzyY"'
  puts 'Example3: bundle exec download_m4a.rb "Titanic Song"'
  puts
  exit 0
end

if ARGV[0].include?('.txt')
  filename = ARGV[0]
  total_lines = File.open(filename).readlines.size
  File.open(filename).each_line.with_index do |line, line_number|
    launch_download(parse_url(line), line_number + 1, total_lines)
  end
else
  launch_download(parse_url(ARGV[0]), 1, 1)
end
puts "DONE (see the folder '#{DOWNLOAD_DIRECTORY}')"
