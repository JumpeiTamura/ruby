require './observer'

class DigitObserver < Observer
  def update(number_generator)
    puts "DigitObserver:#{number_generator.get_number}"
    sleep(0.1)
  end
end
