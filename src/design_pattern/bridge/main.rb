require 'bundler/setup'
require 'pry'
require './count_display'
require './string_display_impl'
require './file_display_impl'
require './random_display'

d1 = Display.new(StringDisplayImpl.new("Hello, Japan."))
d2 = Display.new(StringDisplayImpl.new("Hello, World."))
d3 = CountDisplay.new(StringDisplayImpl.new("Hello, Universe."))

d1.display
d2.display
d3.display
d3.multi_display(5)

d4 = CountDisplay.new(FileDisplayImpl.new("Hello, Heaven.", "./file_display.txt"))

d4.multi_display(5)

d5 = RandomDisplay.new(StringDisplayImpl.new("Hello, Oyage."))

d5.random_display(10)
