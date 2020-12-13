require './display'

class CountDisplay < Display
  def multi_display(count)
    open
    count.times{print}
    close
  end
end
