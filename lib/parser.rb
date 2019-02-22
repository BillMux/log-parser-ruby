class Parser
  attr_reader :urls, :ips

  def initialize(filename)
    @file = File.open(filename)
    @urls  = []
    @ips = []
  end

  def parse
    @file.readlines.each do |line|
      @urls << line.split(' ').first
      @ips << line.split(' ').last
    end
  end
end
