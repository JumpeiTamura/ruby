class UpDownBorder < Display
  def initialize(display, string)
    @display = display
    @string = string
  end

  def get_columns
    @display.get_columns
  end

  def get_rows
    1 + @display.get_rows + 1
  end

  def get_row_text(i)
    sio = StringIO.new
    if i == 0 or i == (get_rows - 1)
      @display.get_columns.times{sio.print @string}
      sio.puts
    else
      sio.puts @display.get_row_text(i - 1)
    end
    sio.string
  end
end
