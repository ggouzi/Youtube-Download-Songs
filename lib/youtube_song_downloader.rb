# Main class, receives an input for STDIN and calls respective Downloaders
class YoutubeSongDownloader
  def initialize(args)
    if args.length.zero? || args[0] == '-h' || args[0] == '--help'
      SimpleLogger.print_help_message
      exit 0
    else
      @input = args[0]
      @counter = Counter.new
      @counter.current = 1
      @settings = FileSettings.new(args[1])
    end
  end

  def download
    if @input.include?('.txt')
      download_file_songs(@input)
    else
      @counter.total = 1
      download_playlist_or_song(@input)
    end
    SimpleLogger.done(@settings)
  end

  def download_file_songs(filename)
    @counter.total = File.open(filename).readlines.size
    File.open(filename).each_line.with_index do |input, line_number|
      @counter.current = line_number + 1
      download_playlist_or_song(input)
    end
  end

  def download_playlist_or_song(input)
    if PlaylistDownloader.playlist?(input)
      @counter.playlist = true
      PlaylistDownloader.download(input, @counter, @settings)
    else
      @counter.playlist = false
      SongDownloader.download(input, @counter, @settings)
    end
  end
end
