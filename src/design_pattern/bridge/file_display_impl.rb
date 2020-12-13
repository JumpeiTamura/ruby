require './abstract_display_impl'

class FileDisplayImpl < AbstractDisplayImpl
  def initialize(str, file)
    @str = str
    @file = file
  end

  def raw_open
    @f = File.open(@file, "w")
  end

  def raw_print
    @f.puts(@str)
  end

  def raw_close
    @f.close
  end
end
