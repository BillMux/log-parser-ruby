# frozen_string_literal: true

# pass in log file as arg, call .parse to organise
class Parser
  attr_reader :urls, :ips, :url_ip_pairs, :visits

  def initialize
    @urls = []
    @ips = []
    @url_ip_pairs = []
    @visits = Hash.new(0)
    @unique_visits = Hash.new(0)
  end

  def parse(filename)
    file = File.open(filename)
    create_arrays(file)
    create_url_ip_hashes
  end

  def show_visits
    @urls.each { |url| @visits[url] += 1 }
    print_views(sort(@visits))
  end

  def show_unique_visits
    @url_ip_pairs.uniq.each do |hash|
      hash.each_key { |url| @unique_visits[url] += 1 }
    end
    print_views(sort(@unique_visits))
  end

  private

  def print_views(list)
    chart = ''
    list.each do |url, count|
      chart += "#{url}: #{count} view#{'s' if count > 1}\n"
    end
    chart.chomp
  end

  def sort(hash)
    hash.sort_by { |_url, count| count }.reverse.to_h
  end

  def create_url_ip_hashes
    @urls.each_index { |i| @url_ip_pairs[i] = { @urls[i] => @ips[i] } }
  end

  def create_arrays(file)
    file.readlines.each do |line|
      @urls << line.split.first
      @ips << line.split.last
    end
  end
end
