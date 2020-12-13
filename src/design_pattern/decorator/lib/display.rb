class Display
  def show
    get_rows.times do |i|
      puts get_row_text(i)
    end
  end

  def get_columns
    raise 'not implemented'
  end

  def get_rows
    raise 'not implemented'
  end

  def get_row_text(i)
    raise 'not implemented'
  end
end
