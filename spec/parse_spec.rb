# frozen_string_literal: true

require_relative '../lib/parser'
require 'rspec'

describe Parser do
  subject { Parser.new('src/testserver.log') }

  describe '#parse' do
    before(:each) do
      subject.parse
    end

    it 'can return an array of urls' do
      expect(subject.urls[0]).to eq('/help_page/1')
    end

    it 'can return an array of ip addresses' do
      expect(subject.ips[0]).to eq('126.318.035.038')
    end

    it 'puts urls and addresses into hash' do
      expect(subject.url_ip_pairs[0]).to eq(
        '/help_page/1' => '126.318.035.038'
      )
    end
  end
end
