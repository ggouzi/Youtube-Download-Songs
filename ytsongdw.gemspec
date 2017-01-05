# Generated by juwelier
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Juwelier::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: ytsongdw 0.1.3 ruby lib

Gem::Specification.new do |s|
  s.name = 'ytsongdw'
  s.version = '0.1.3'

  s.required_rubygems_version = Gem::Requirement.new('>= 0') if s.respond_to? :required_rubygems_version=
  s.require_paths = ['lib']
  s.authors = %w(teonimesic ggouzi)
  s.date = '2017-01-05'
  s.description = 'Supports youtube urls, playlists and fulltext search'
  s.email = 'stefano@heavenstudio.com.br'
  s.extra_rdoc_files = [
    'LICENSE.txt',
    'README.md'
  ]
  s.files = [
    '.codeclimate.yml',
    '.rspec',
    '.rubocop.yml',
    '.ruby-version',
    'Gemfile',
    'Gemfile.lock',
    'README.md',
    'VERSION',
    'download_m4a.rb',
    'songs.txt',
    'spec/spec_helper.rb',
    'spec/test.txt',
    'spec/youtube_song_downloader_spec.rb'
  ]
  s.homepage = 'http://github.com/heavenstudio/ytsongdw'
  s.licenses = ['GPL 2.0']
  s.required_ruby_version = Gem::Requirement.new('>= 2.0')
  s.rubygems_version = '2.5.1'
  s.summary = 'Gem to download songs from youtube videos'

  if s.respond_to? :specification_version
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0')
      s.add_runtime_dependency('memoist', ['>= 0'])
      s.add_runtime_dependency('nokogiri', ['>= 0'])
      s.add_runtime_dependency('scrapifier', ['>= 0'])
      s.add_runtime_dependency('youtube-dl.rb', ['>= 0'])
      s.add_development_dependency('codeclimate-test-reporter', ['>= 0'])
      s.add_development_dependency('pry', ['>= 0'])
      s.add_development_dependency('rdoc', ['~> 3.12'])
      s.add_development_dependency('rspec', ['>= 0'])
      s.add_development_dependency('simplecov', ['>= 0'])
      s.add_development_dependency('juwelier', ['~> 2.1.0'])
    else
      s.add_dependency('memoist', ['>= 0'])
      s.add_dependency('nokogiri', ['>= 0'])
      s.add_dependency('scrapifier', ['>= 0'])
      s.add_dependency('youtube-dl.rb', ['>= 0'])
      s.add_dependency('codeclimate-test-reporter', ['>= 0'])
      s.add_dependency('pry', ['>= 0'])
      s.add_dependency('rdoc', ['~> 3.12'])
      s.add_dependency('rspec', ['>= 0'])
      s.add_dependency('simplecov', ['>= 0'])
      s.add_dependency('juwelier', ['~> 2.1.0'])
    end
  else
    s.add_dependency('memoist', ['>= 0'])
    s.add_dependency('nokogiri', ['>= 0'])
    s.add_dependency('scrapifier', ['>= 0'])
    s.add_dependency('youtube-dl.rb', ['>= 0'])
    s.add_dependency('codeclimate-test-reporter', ['>= 0'])
    s.add_dependency('pry', ['>= 0'])
    s.add_dependency('rdoc', ['~> 3.12'])
    s.add_dependency('rspec', ['>= 0'])
    s.add_dependency('simplecov', ['>= 0'])
    s.add_dependency('juwelier', ['~> 2.1.0'])
  end
end