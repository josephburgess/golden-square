class MusicList
  def initialize
    @list = []
  end

  def addtrack(track)
    @list << track
  end

  def printtracks
    raise 'No tracks added!' if @list == []

    @list.join(', ')
  end
end
