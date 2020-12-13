require './abstract_display_impl'

class StringDisplayImpl < AbstractDisplayImpl
  def initialize(str)
    @str = str
    @size = str.size
  end

  def raw_open
    print_line
  end

  def raw_print
    puts "|#{@str}|"
  end

  def raw_close
    print_line
  end

  private

  def print_line
    print "+"
    @size.times{print "-"}
    puts "+"
  end
end
