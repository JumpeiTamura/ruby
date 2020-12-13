require 'stringio'

class BigChar
  def initialize(char)
    @bigchar = StringIO.new
    open("./big#{char}.txt"){|f| @bigchar.puts f.read}
  end

  def to_s
    @bigchar.string
  end
end
