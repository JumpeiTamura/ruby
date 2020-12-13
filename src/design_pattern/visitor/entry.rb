class Entry
  def get_size
    raise 'not implemented'
  end

  def get_name
    raise 'not implemented'
  end

  def to_s
    "#{get_name}(#{get_size})"
  end
end
