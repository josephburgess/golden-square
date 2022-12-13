require 'secretdiary'

describe SecretDiary do
  it 'initializes taking a diary class as a parameter' do
    fake_entry = double(:fake_diary_entry, read: 'This is my diary')
    secretdiary = SecretDiary.new(fake_entry)
    expect(secretdiary.instance_variable_get(:@contents)).to eq 'This is my diary'
  end

  it 'will throw an error message if trying to read while locked' do
    fake_entry = double(:fake_diary_entry, read: 'This is my diary')
    secretdiary = SecretDiary.new(fake_entry)
    expect { secretdiary.read }.to raise_error 'Go away!'
  end

  it 'will read the diary if it has been unlocked' do
    fake_entry = double(:fake_diary_entry, read: 'This is my diary')
    secretdiary = SecretDiary.new(fake_entry)
    secretdiary.unlock
    expect(secretdiary.read).to eq 'This is my diary'
  end

  it 'will lock the diary if instructed' do
    fake_entry = double(:fake_diary_entry, read: 'This is my diary')
    secretdiary = SecretDiary.new(fake_entry)
    secretdiary.unlock
    secretdiary.lock
    expect { secretdiary.read }.to raise_error 'Go away!'
  end
end
