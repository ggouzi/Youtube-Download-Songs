# Simple STDOUT logger containing all texts
module Logger
  def self.log(text)
    puts "# #{text}"
  end

  def self.progress(element, counter)
    if counter.playlist
      playlist_progress(element, counter)
    else
      song_progress(element, counter)
    end
  end

  def self.base_progress(_element, counter)
    "#{counter.current}/#{counter.total}"
  end

  def self.song_progress(element, counter)
    log "#{base_progress(element, counter)} - #{element.name}"
  end

  def self.playlist_progress(element, counter)
    log "#{base_progress(element, counter)}" \
         " <#{counter.playlist_current}/#{counter.playlist_total}>" \
         " - #{element.name}"
  end

  def self.maximum_number_of_tries
    log 'MAXIMUM NUMBER OF TRIES EXCEEDED'
  end

  def self.retry(url, name, number_of_tries)
    log "COULDN'T DOWNLOAD #{url}/#{name} TRY ##{number_of_tries}"
  end

  def self.downloading(song)
    log "DOWNLOADING #{song.url}/#{song.name}"
  end

  def self.finished_downloading
    log 'FINISHED'
    log ''
  end

  def self.found_no_results(url)
    log "DIDNT FIND ANY RESULTS FOR #{url}"
  end

  def self.couldnt_fetch_playlist_url
    log "COULDN'T FETCH PLAYLIST VIDEO URLS"
  end

  def self.done(settings)
    log "DONE (see the folder '#{settings.folder}')"
  end

  def self.print_help_message
    log 'You should pass one or two parameters: The song name/youtube url or the file'
    log 'containing all youtube songs/urls to download and an optional folder to download'
    log 'it to (defaults to ~/Music)'
    log 'make sure youve run `bundle install` first to download dependencies and then one of:'
    log 'Example1: bundle exec download_m4a.rb test.txt'
    log 'Example2: bundle exec download_m4a.rb "https://www.youtube.com/watch?v=bM7SZ5SBzyY"'
    log 'Example3: bundle exec download_m4a.rb "https://www.youtube.com/playlist?list=PL9B23A78D3D249A74"'
    log 'Example4: bundle exec download_m4a.rb "Titanic Song"'
  end
end
