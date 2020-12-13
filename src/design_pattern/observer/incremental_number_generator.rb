require './number_generator'

class IncrementalNumberGenerator < NumberGenerator
  def initialize(start, to, by)
    @start = start
    @to = to
    @by = by
    super()
  end

  def execute
    @start.step(to: @to, by: @by) do |i|
      @number = i
      notify_observers
    end
  end
end
