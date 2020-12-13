class Display
  def initialize(display_impl)
    @display_impl = display_impl
  end

  def display
    open
    print
    close
  end

  private

  def open
    @display_impl.raw_open
  end

  def print
    @display_impl.raw_print
  end

  def close
    @display_impl.raw_close
  end
end
