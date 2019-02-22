class Parser
  attr_reader :urls, :ips, :url_ip_hash

  def initialize(filename)
    @file = File.open(filename)
    @urls  = []
    @ips = []
    @url_ip_hash = []
  end

  def parse
    create_arrays

    for x in 0...@urls.length
      @url_ip_hash[x] = { @urls[x] => @ips[x] }
    end

  end

  private

  def create_arrays
    @file.readlines.each do |line|
      @urls << line.split(' ').first
      @ips << line.split(' ').last
    end
  end
end
