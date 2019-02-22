require_relative '../lib/parser'
require 'rspec'

describe Parser do
  before(:each) do
    @parser = Parser.new('src/testserver.log')
    @parser.parse
  end
  
  it 'collect each urls visit count' do
    @parser.show_visits
    expect(@parser.visits['/help_page/1']).to eq(4)
  end

  it 'hashes all urls and their visits counts' do
    expect(@parser.show_visits).to eq(
      '/help_page/1' => 4,
      '/home' => 2,
      '/contact' => 1,
      '/about/2' => 1,
      '/index' => 1,
      '/about' => 1
    )
  end

  it 'can display results in order of unique visits' do
    expect(@parser.show_unique_visits).to eq(
      '/help_page/1' => 3,
      '/contact' => 1,
      '/home' => 1,
      '/about/2' => 1,
      '/index' => 1,
      '/about' => 1
    )
  end
end