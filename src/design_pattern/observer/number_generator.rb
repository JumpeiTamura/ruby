class NumberGenerator
  def initialize
    @observers = []
    @number = 0
  end

  def add_observer(observer)
    @observers << observer
  end

  def execute
    raise 'not implemented'
  end

  def get_number
    @number
  end

  private
  def notify_observers
    @observers.each{|observer| observer.update(self)}
  end
end
