require 'diary'

describe Diary do
  it 'initializes taking a string as the diary contents' do
    diary = Diary.new('This is my diary.')
    expect(diary.instance_variable_get(:@contents)).to eq 'This is my diary.'
  end
end
