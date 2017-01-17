require_relative 'spec_helper'

describe YoutubeSongDownloader do
  let(:upload_directory) { "#{__dir__}/tmp/" }
  let(:downloader) { described_class.new(args) }

  before do
    $stdout = StringIO.new
    FileUtils.rm_rf upload_directory
    Dir.mkdir upload_directory
  end

  after(:all) do
    $stdout = STDOUT
  end

  def exit_status
    downloader.download
  rescue SystemExit => e
    e.status
  end

  def number_of_files
    Dir["#{upload_directory}**/*.m4a"].length
  end

  context 'with no arguments' do
    let(:args) { [] }
    it 'exits' do
      expect(exit_status).to be_zero
    end
  end

  context 'with argument "-h"' do
    let(:args) { ['-h'] }
    it 'exits' do
      expect(exit_status).to be_zero
    end
  end

  context 'with argument "--help"' do
    let(:args) { ['--help'] }
    it 'exits' do
      expect(exit_status).to be_zero
    end
  end

  context 'with a youtube url as the first argument' do
    let(:args) { ['https://youtu.be/xZ2P-_mF2Ek', upload_directory] }

    it 'downloads its song' do
      expect { downloader.download }.to change { number_of_files }.from(0).to(1)
    end
  end

  context 'with a youtube text as the first argument' do
    let(:args) { ['weirdstringtosearchfor', upload_directory] }

    it 'finds and downloads the song of the first video that matches the text' do
      expect { downloader.download }.to change { number_of_files }.from(0).to(1)
    end
  end

  context 'with a playlist url as the first argument' do
    let(:args) { ['https://www.youtube.com/playlist?list=PL8-XLhqOZkDE0krq95qaGIKSSYdDFXoYM', upload_directory] }

    it 'downloads all songs of videos on the playlist' do
      expect { downloader.download }.to change { number_of_files }.from(0).to(2)
    end
  end

  context 'with a file as the first argument' do
    let(:args) { ["#{__dir__}/test.txt", upload_directory] }

    it 'downloads all songs contained in file' do
      expect { downloader.download }.to change { number_of_files }.from(0).to(2)
    end
  end
end
