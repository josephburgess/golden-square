require 'diary_entry2'
require 'diary'

medium_entry = DiaryEntry.new('Medium Entry',
                              'Etiam nec consequat arcu. Nullam dignissim tortor id felis ullamcorper, sit amet suscipit sem aliquet. Nullam a augue vel tortor volutpat faucibus at ut lacus. Praesent ut neque neque. Proin consequat malesuada nisi a bibendum. Pellentesque vel mi eget nunc luctus porttitor in eget erat. Cras eget lectus semper, ornare dolor ut, scelerisque ipsum. Ut id arcu tristique, venenatis diam vel, feugiat dolor. Integer eu luctus lacus. In eget libero maximus, tincidunt justo at, tempor dolor. Mauris convallis dolor urna, quis egestas orci interdum ut. Nulla a turpis ac erat placerat suscipit. In hac habitasse platea dictumst. Duis maximus nunc.')

long_entry = DiaryEntry.new('Long Enty',
                            'Duis el tempor ex a feugiat placerat. Nunc gravida ligula non ex ullamcorper imperdiet. Mauris volutpat iaculis orci vel lobortis. Donec auctor massa et augue fermentum, at commodo magna interdum. Morbi vel convallis massa. Aliquam quis dui placerat, faucibus enim vel, feugiat nunc. Morbi ultrices, velit consequat ullamcorper finibus, arcu eros pellentesque dolor, in dictum mauris odio quis turpis. Ut vulputate tellus quis nisl dictum, non scelerisque tellus efficitur. Fusce blandit vestibulum eleifend. Phasellus pellentesque sit amet leo ac commodo. Sed elementum est massa, eu vestibulum nisl malesuada non. Quisque nec justo sem. Ut gravida ultricies sapien, semper varius neque congue auctor. Integer congue nulla nibh, non tincidunt sem rhoncus at. Aenean interdum vitae risus at maximus. Mauris fringilla eros a efficitur molestie. Curabitur in diam orci. Nam pulvinar efficitur dictum. Fusce eu dui volutpat, faucibus lacus nec, sollicitudin eros. Phasellus viverra sit amet magna id facilisis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Mauris in placerat odio. Mauris elementum dui at imperdiet imperdiet. Nulla a leo tellus. Fusce tincidunt dui molestie dictum eleifend.Quisque hendrerit convallis orci. Vestibulum eget nisi nec urna scelerisque accumsan ac ut velit. Praesent maximus nunc a mauris maximus facilisis. Suspendisse.')

describe 'diary integration' do
  it 'will add a new diary entry when passed a diary entry instance' do
    diary = Diary.new
    diary.add(medium_entry)
    expect(diary.all).to eq [medium_entry]
  end
  it 'will return a list of all diary entries' do
    diary = Diary.new
    diary.add(medium_entry)
    diary.add(long_entry)
    expect(diary.all).to eq [medium_entry, long_entry]
  end
  it 'will count the amount of words in all diary entries' do
    diary = Diary.new
    diary.add(medium_entry)
    diary.add(long_entry)
    expect(diary.count_words).to eq 300
  end
  it 'will return 3 minutes when all diaries have 300 words and the user reads 100wpm' do
    diary = Diary.new
    diary.add(long_entry)
    diary.add(medium_entry)
    expect(diary.reading_time(100)).to eq 'It will take 3 minute(s) to read this'
  end
  it 'will find and return a 200 word entry when the user reads 200wpm and has 1 minute to read' do
    diary = Diary.new
    diary.add(medium_entry)
    diary.add(long_entry)
    expect(diary.find_best_entry_for_reading_time(200, 1)).to eq long_entry.contents
  end
  it 'will find and return a 100 word entry when the user reads 100wpm and has 1 minute to read' do
    diary = Diary.new
    diary.add(medium_entry)
    diary.add(long_entry)
    expect(diary.find_best_entry_for_reading_time(100, 1)).to eq medium_entry.contents
  end
end
