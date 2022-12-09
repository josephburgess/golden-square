require 'diary'

describe Diary do
  it 'constructs properly' do
    diary = Diary.new
  end
  it 'has an empty entries array when no entries have been added' do
    diary = Diary.new
    expect(diary.all).to eq []
  end
end
