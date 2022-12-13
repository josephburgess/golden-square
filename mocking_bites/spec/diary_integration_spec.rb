require 'secretdiary'
require 'diary'

RSpec.describe 'Secret Diary integration' do
  it 'will raise an error when trying to read if the diary is locked' do
    diary = Diary.new('This is my diary')
    secretdiary = SecretDiary.new(diary)
    expect { secretdiary.read }.to raise_error 'Go away!'
  end

  it 'will read the diary if the diary is unlocked' do
    diary = Diary.new('This is my diary')
    secretdiary = SecretDiary.new(diary)
    secretdiary.unlock
    expect(secretdiary.read).to eq 'This is my diary'
  end
end
