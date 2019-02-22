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

  it 'can return an array of ip addresses' do
    expect(@parser.ips[0]).to eq('126.318.035.038')
  end

  it 'puts urls and addresses into hash' do
    expect(@parser.url_ip_pairs[0]).to eq(
      '/help_page/1' => '126.318.035.038'
    )
  end

  it 'collect each urls visit count' do
    @parser.show_visits
    expect(@parser.visits['/help_page/1']).to eq(4)
  end

  it 'hashes all urls and their visits counts' do
    expect(@parser.show_visits).to eq(
      '/help_page/1' => 4,
      '/contact' => 1,
      '/home' => 2,
      '/about/2' => 1,
      '/index' => 1,
      '/about' => 1,
    )
  end
end
