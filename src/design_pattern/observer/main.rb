require './random_number_generator'
require './incremental_number_generator'
require './digit_observer'
require './graph_observer'

generator2 = IncrementalNumberGenerator.new(10, 50, 5)

ob1 = DigitObserver.new
ob2 = GraphObserver.new

generator2.add_observer(ob1)
generator2.add_observer(ob2)

generator2.execute
