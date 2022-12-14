require 'calculator'

RSpec.describe InteractiveCalculator do
  before(:each) do
    @io = double :io
    @calculator = InteractiveCalculator.new(@io)
  end
  it 'Greets the user and requests a number' do
    expect(@io).to receive(:puts).with('Hello. I will subtract two numbers.')
    expect(@io).to receive(:puts).with('Please enter a number')
    expect(@io).to receive(:gets).and_return(4)
    expect(@io).to receive(:puts).with('Please enter another number')
    expect(@io).to receive(:gets).and_return(3)
    expect(@io).to receive(:puts).with('Here is your result:')
    expect(@io).to receive(:puts).with('4 - 3 = 1')
    @calculator.run
  end
end
