class Parser

  def initialize(filename)
    @file = File.open(filename)
    @urls  = []
  end

end
