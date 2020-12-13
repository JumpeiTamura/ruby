class StringDisplay < Display
  def initialize(string)
    @string = string
  end

  def get_columns
    @string.size
  end

  def get_rows
    1
  end

  def get_row_text(i)
    return @string if i == 0
    ""
  end
end
