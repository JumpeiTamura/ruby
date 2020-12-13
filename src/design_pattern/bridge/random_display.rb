require './count_display'

class RandomDisplay < CountDisplay
  def random_display(count)
    random_count = rand(1..count)
    multi_display(random_count)
  end
end
