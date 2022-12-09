require 'diary_entry2'

describe 'DiaryEntry' do
  entry = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sit amet lectus a nibh mollis auctor id non est. Sed tempor venenatis tellus eget pellentesque. Nullam id diam et felis pulvinar condimentum quis fermentum ex. Quisque id diam nunc. Vivamus in malesuada nisl. Donec et arcu nisi. Phasellus consectetur ac enim at posuere. Nunc dignissim tempor justo, quis egestas massa egestas ac. Morbi porttitor lacus ut consectetur consequat. Nulla tincidunt, felis ut gravida blandit, ex nisl scelerisque lacus, eget facilisis erat ipsum in ligula. Mauris et enim id tortor fermentum commodo. Nunc vulputate sodales quam ac sodales. Phasellus ac diam eu felis tincidunt lacinia ut in dui. Proin ullamcorper metus sed enim volutpat, et lobortis purus dignissim. Cras eu nisl vitae ex dictum fermentum. Aenean auctor nibh eget bibendum lobortis. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vestibulum faucibus ac justo id vulputate. Suspendisse rutrum sapien vel condimentum pretium. Curabitur a vulputate nunc. Curabitur eu nibh ante. Ut dignissim mi tempus, tincidunt augue id, semper leo. Duis auctor bibendum metus, vitae rhoncus elit tincidunt sed. In vel convallis ligula. Praesent tellus purus, pellentesque non imperdiet vitae, dignissim id nisl. Vivamus non urna at nisi consectetur condimentum. Sed.'

  diary_entry = DiaryEntry.new('Peter Pan', entry)

  it 'constructs with title' do
    expect(diary_entry.title).to eq 'Peter Pan'
  end
  it 'constructs with contents' do
    expect(diary_entry.contents).to eq entry
  end
  it 'should return the number of words in the contents as an integer' do
    expect(diary_entry.count_words).to eq 200
  end
  it 'should return the time estimated to read the contents given a wpm reading rate' do
    expect(diary_entry.reading_time(200)).to eq 1
  end
  it 'should return the amount of words the user can read in a given number of minutes' do
    expect(diary_entry.reading_chunk(100, 1)).to eq entry.split[0..99].join(' ')
  end
  it 'should continue with the diary entry chunk when called multiple times' do
    diary_entry = DiaryEntry.new('Peter Pan', entry)
    diary_entry.reading_chunk(100, 1)
    expect(diary_entry.reading_chunk(50, 1)).to eq entry.split[100..149].join(' ')
  end
end
