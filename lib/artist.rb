class Artist
  attr_accessor :name
  
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
    @songs = []
  end
  
  def self.all
    @@all
  end
  
  def add_song(song)
    if Song.all.include?(song) != false
        Song.all << song
    end
    if song.artist == self
      @songs << song
      song
    elsif song.artist == nil
      song.artist = self
      @songs << song
      song
    else 
      puts "This song belongs to a different artist."
    end
  end
  
  def self.find_or_create_by_name(name)
    if Artist.all.find{|artist| artist.name == name} != nil
      found_artist = Artist.all.find{|artist| artist.name == name}
      found_artist
    else
      new_artist = Artist.new(name)
      new_artist
    end
  end
  
  def songs
    Song.all.select{|song| song.artist == self}
  end
  
  def print_songs
   i = 0 
   printed_songs = []
   while i <= songs.count
    if printed_songs.include?(songs[i]) == false
      printed_songs << songs[i].name
    end
    i+=1
  end
   puts printed_songs
end
end