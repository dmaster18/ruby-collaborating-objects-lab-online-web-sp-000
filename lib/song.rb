class Song

  attr_accessor :name, :artist
  
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def artist_name=(artist_name)
    artist_name = Artist.find_or_create_by_name(artist_name).name
    @artist_name = artist_name
  end
  
  def artist_name
    @artist_name
  end

  def self.new_by_filename(filename)
    filename = filename.delete('.mp3').strip
    normalized_filename = filename.split(/[ -.]/)
  end

end