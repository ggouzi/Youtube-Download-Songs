require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

require 'open-uri'
require_relative 'youtube_song_downloader/logger'
require_relative 'youtube_song_downloader/counter'
require_relative 'youtube_song_downloader/file_settings'
require_relative 'youtube_song_downloader/downloader'
require_relative 'youtube_song_downloader/playlist_downloader'
require_relative 'youtube_song_downloader/song_downloader'
require_relative 'youtube_song_downloader/youtube_song_downloader'
