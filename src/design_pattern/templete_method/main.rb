require 'bundler/setup'
require 'pry'
Dir["lib/*.rb"].each{|file| require_relative file}

d1 = CharDisplay.new("H")
d2 = StringDisplay.new("hello, world")
d3 = StringDisplay.new("こんにちは")

d1.display
d2.display
d3.display
