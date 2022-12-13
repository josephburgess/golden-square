class Track
  def initialize(title, artist)
    @title = title
    @artist = artist
  end

  def matches?(keyword) # keyword is a string
    @title.match?(keyword) || @artist.match?(keyword)
  end
end
