require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

require 'open-uri'
require_relative 'simple_logger'
require_relative 'counter'
require_relative 'file_settings'
require_relative 'downloader'
require_relative 'playlist_downloader'
require_relative 'song_downloader'
require_relative 'youtube_song_downloader'
