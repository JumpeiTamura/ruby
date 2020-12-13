require 'stringio'
require './bigchar_factory'

class BigString
  def initialize(str)
    @bigstring = StringIO.new
    factory = BigCharFactory.instance
    str.each_char do |char|
      bigchar = factory.get_bigchar(char)
      @bigstring.puts bigchar
    end
  end

  def to_s
    @bigstring.string
  end
end
