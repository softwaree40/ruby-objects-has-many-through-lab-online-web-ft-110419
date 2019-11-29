class Genre
  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    self.class.all << self
  end

  def songs
    Song.all.select { |s| s.genre == self }
  end

  def artists
    self.songs.collect { |s| s.artist }
  end

  def self.all
    @@all
  end

end