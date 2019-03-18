# frozen_string_literal: true

require_relative '../lib/parser'

describe Parser do
  subject { Parser.new }

  before(:each) do
    subject.parse('src/testserver.log')
  end

  it 'collect each urls visit count' do
    subject.show_visits
    expect(subject.visits['/help_page/1']).to eq(4)
  end

  it 'hashes all urls and their visits counts' do
    expect(subject.show_visits).to eq(
      '/help_page/1' => 4,
      '/home' => 2,
      '/contact' => 1,
      '/about/2' => 1,
      '/index' => 1,
      '/about' => 1
    )
  end

  it 'can display results in order of unique visits' do
    expect(subject.show_unique_visits).to eq(
      '/help_page/1' => 3,
      '/contact' => 1,
      '/home' => 1,
      '/about/2' => 1,
      '/index' => 1,
      '/about' => 1
    )
  end
end
