require 'music_library'

RSpec.describe MusicLibrary do
  it 'initializes with an empty array' do
    music_library = MusicLibrary.new
    expect(music_library.instance_variable_get(:@library)).to eq []
  end

  it 'can add tracks to the library' do
    music_library = MusicLibrary.new
    track_1 = double :track
    track_2 = double :track
    music_library.add(track_1)
    music_library.add(track_2)
    expect(music_library.all).to eq [track_1, track_2]
  end

  it 'can search library for an artist or song' do
    music_library = MusicLibrary.new
    track_1 = double :track, matches?: true
    track_2 = double :track, matches?: false
    music_library.add(track_1)
    music_library.add(track_2)
    expect(music_library.search('keyword')).to eq [track_1]
  end
end
