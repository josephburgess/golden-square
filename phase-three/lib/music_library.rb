class MusicLibrary
  def initialize
    @library = []
  end

  def add(track) # track is an instance of Track
    @library << track
  end

  def all
    @library # Returns a list of track objects
  end

  def search(keyword) # keyword is a string
    @library.select do |track|
      track.matches?(keyword)
    end
  end
end
