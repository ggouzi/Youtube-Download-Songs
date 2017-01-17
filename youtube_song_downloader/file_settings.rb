# Simple settings class used to configure download path
class FileSettings
  DOWNLOAD_DIRECTORY = '~/Music/'.freeze

  attr_accessor :folder, :subfolder

  def initialize(folder = nil)
    @folder = folder || DOWNLOAD_DIRECTORY
  end

  def filepath(name)
    @folder + @subfolder.to_s + sanitize(name) + '.m4a'
  end

  def sanitize(name)
    return '' if name.nil? || name == ''
    name.strip.tr('/', '|')
  end
end
