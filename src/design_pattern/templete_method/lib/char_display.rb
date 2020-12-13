require_relative 'abstract_display'

class CharDisplay < AbstractDisplay
  def initialize(char)
    @char = char
  end

  def open
    print "<<"
  end

  def write
    print @char
  end

  def close
    puts ">>"
  end
end
