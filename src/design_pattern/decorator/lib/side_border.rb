class SideBorder < Display
  def initialize(display, border_char)
    @display = display
    @border_char = border_char
  end

  def get_columns
    1 + @display.get_columns + 1
  end

  def get_rows
    @display.get_rows
  end

  def get_row_text(i)
    "#{@border_char}#{@display.get_row_text(i)}#{@border_char}"
  end
end
