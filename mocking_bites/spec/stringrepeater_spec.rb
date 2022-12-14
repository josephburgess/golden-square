require 'stringrepeater'

RSpec.describe do
  it 'will request a string, followed by a number(x), then output the string x times' do
    io = double :io
    expect(io).to receive(:puts).with('Hello. I will repeat a string many times.')
    expect(io).to receive(:puts).with('Please enter a string')
    expect(io).to receive(:gets).and_return('TWIX')
    expect(io).to receive(:puts).with('Please enter a number of repeats')
    expect(io).to receive(:gets).and_return(10)
    expect(io).to receive(:puts).with('Here is your result:')
    expect(io).to receive(:puts).with('TWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIX')
    repeater = StringRepeater.new(io)
    repeater.run
  end
end
