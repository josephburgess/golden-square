require 'catfacts'

RSpec.describe CatFacts do
  it 'provides a cat fact to the user' do
    mock_requester = double :requester
    cat_facts = CatFacts.new(mock_requester)
    expect(mock_requester).to receive(:get).with(URI('https://catfact.ninja/fact')).and_return('{"fact":"Ginger tabby cats can have freckles around their mouths and on their eyelids!","length":77}')
    expect(cat_facts.provide).to eq 'Cat fact: Ginger tabby cats can have freckles around their mouths and on their eyelids!'
  end
end
