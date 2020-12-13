require './number_generator'

class RandomNumberGenerator < NumberGenerator
  def execute
    20.times do
      @number = rand(50)
      notify_observers
    end
  end
end
