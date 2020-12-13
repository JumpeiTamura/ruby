require 'bundler/setup'
require 'pry'
require './lib/support'

Dir["lib/*.rb"].each{|file| require_relative file}

alice = NoSupport.new("Alice")
bob = LimitSupport.new("Bob", 100)
charlie = SpecialSupport.new("Charlie", 429)
diana = LimitSupport.new("Diana", 200)
elmo = OddSupport.new("Elmo")
fred = LimitSupport.new("Fred", 300)

alice.set_next(bob).set_next(charlie).set_next(diana).set_next(elmo).set_next(fred)

0.step(to: 500, by: 33) do |i|
  alice.support Trouble.new(i)
end
