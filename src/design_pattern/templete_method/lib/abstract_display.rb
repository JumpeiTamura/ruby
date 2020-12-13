class AbstractDisplay
  def display
    open
    5.times{ write }
    close
  end

  def open
    raise 'not implemented'
  end

  def write
    raise 'not implemented'
  end

  def close
    raise 'not implemented'
  end
end
