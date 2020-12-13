require_relative 'abstract_display'

class StringDisplay < AbstractDisplay
  def initialize(str)
    @str = str
    @size = str.size
  end

  def open
    print_line
  end

  def write
    puts "|#{@str}|"
  end

  def close
    print_line
  end

  private

  def print_line
    print "+"
    @size.times{ print "-" }
    puts "+"
  end
end
