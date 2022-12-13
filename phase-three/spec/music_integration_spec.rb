require 'music_library'
require 'track'

RSpec.describe 'Music Library integration' do
  it 'adds and lists tracks' do
    music_library = MusicLibrary.new
    track1 = Track.new('Queen', 'Bohemian Rhapsody')
    track2 = Track.new('Jimi Hendrix', 'Hey Joe')
    music_library.add(track1)
    music_library.add(track2)
    expect(music_library.all).to eq [track1, track2]
  end
  it 'searches stored tracks for matching artists or songs' do
    music_library = MusicLibrary.new
    track1 = Track.new('Queen', 'Bohemian Rhapsody')
    track2 = Track.new('Jimi Hendrix', 'Hey Joe')
    music_library.add(track1)
    music_library.add(track2)
    expect(music_library.search('Queen')).to eq [track1]
  end
end
