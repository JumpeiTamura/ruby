require 'bundler/setup'
require 'pry'

require './bigstring'

str = ARGV[0]

if str.nil?
  puts "Usage: ruby main.rb 012012"
  exit
end

bigstring = BigString.new(str)
puts bigstring
