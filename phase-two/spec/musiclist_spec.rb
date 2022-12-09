require_relative '../lib/musiclist'

describe MusicList do
  it 'will return an empty list if given no tracks' do
    music_list = MusicList.new
    expect(music_list.addtrack('')).to eq ['']
  end

  it 'will return an error if trying to print tracks with no tracks added' do
    music_list = MusicList.new
    expect { music_list.printtracks }.to raise_error 'No tracks added!'
  end

  it 'will return Queen - Bohemian Rhapsody if it has been added' do
    music_list = MusicList.new
    music_list.addtrack('Queen - Bohemian Rhapsody')
    expect(music_list.printtracks).to eq 'Queen - Bohemian Rhapsody'
  end

  it 'will return a tracklist when multiple tracks have been added' do
    music_list = MusicList.new
    music_list.addtrack('Queen - Bohemian Rhapsody')
    music_list.addtrack('Led Zeppelin - Immigrant Song')
    music_list.addtrack('Jimi Hendrix - All along the watchtower')
    expect(music_list.printtracks).to eq 'Queen - Bohemian Rhapsody, Led Zeppelin - Immigrant Song, Jimi Hendrix - All along the watchtower'
  end
end
