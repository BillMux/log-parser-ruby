require_relative '../lib/parser'
require 'rspec'

describe Parser do

  before(:each) do
    @parser = Parser.new('src/testserver.log')
    @parser.parse
  end

  it 'can return an array of urls' do
    expect(@parser.urls[0]).to eq('/help_page/1')
  end
end
