require 'bundler/setup'
require 'pry'
Dir["lib/*.rb"].each{|file| require_relative file}

d1 = StringDisplay.new("Hello, World.")
d2 = SideBorder.new(d1, '#')
d3 = FullBorder.new(d2)
d4 = UpDownBorder.new(d3, '*')

d1.show
d2.show
d3.show
d4.show
