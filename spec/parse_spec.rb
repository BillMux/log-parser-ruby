# frozen_string_literal: true

require_relative '../lib/parser'
require 'rspec'

describe Parser do
  subject { Parser.new }

  describe '#parse' do
    before(:each) do
      subject.parse('src/testserver.log')
    end

    it 'puts urls and addresses into hash' do
      expect(subject.url_ip_pairs[0]).to eq(
        '/help_page/1' => '126.318.035.038'
      )
    end
  end
end
