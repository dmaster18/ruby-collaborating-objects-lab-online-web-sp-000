class MP3Importer
  attr_accessor :path
  
  def initialize(path)
    @path = path
    @song_array = []
  end
  
  def files
    @mp3_array = @path.split("/")
    @mp3_string = @mp3_array.slice(@mp3_array.find_index("mp3s"),@mp3_array.length).join
  end
  
  def import
    Song.new_by_filename(@mp3_string)
  end
end