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
    # subject.show_unique_visits
    expect(subject.show_visits).to eq(
      "/help_page/1: 4 views\n"\
      "/home: 2 views\n"\
      "/about: 1 view\n"\
      "/index: 1 view\n"\
      "/about/2: 1 view\n"\
      "/contact: 1 view"
    )
  end

  it 'can display formatted results in order of unique visits' do
    expect(subject.show_unique_visits).to eq(
      "/help_page/1: 3 views\n"\
      "/about: 1 view\n"\
      "/index: 1 view\n"\
      "/about/2: 1 view\n"\
      "/home: 1 view\n"\
      "/contact: 1 view"
    )
  end
end
