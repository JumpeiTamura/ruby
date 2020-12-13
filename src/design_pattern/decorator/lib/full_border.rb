class FullBorder < Display
  def initialize(display)
    @display = display
  end

  def get_columns
    1 + @display.get_columns + 1
  end

  def get_rows
    1 + @display.get_rows + 1
  end

  def get_row_text(i)
    sio = StringIO.new
    if i == 0 or i == (get_rows - 1)
      sio.print "+"
      @display.get_columns.times{sio.print "-"}
      sio.puts "+"
    else
      sio.puts "|#{@display.get_row_text(i - 1)}|"
    end
    sio.string
  end
end
