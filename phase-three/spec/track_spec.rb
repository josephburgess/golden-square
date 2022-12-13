require 'track'

RSpec.describe Track do
  it 'initializes with a title and artist' do
    track_1 = Track.new('Bohemian Rhapsody', 'Queen')
    expect(track_1.instance_variable_get(:@title)).to eq 'Bohemian Rhapsody'
    expect(track_1.instance_variable_get(:@artist)).to eq 'Queen'
  end
  it 'searches for matching keywords in the track or artist name' do
    track_1 = Track.new('Bohemian Rhapsody', 'Queen')
    expect(track_1.matches?('Queen')).to eq true
  end
end
