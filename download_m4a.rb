#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'dependencies'

YoutubeSongDownloader.new(ARGV).download
