require 'bundler/setup'
require 'pry'
Dir["idcard/*.rb"].each{|file| require_relative file}
Dir["car/*.rb"].each{|file| require_relative file}

factory = IdCardFactory.new
product1 = factory.create('foo')
product2 = factory.create('bar')
product3 = factory.create('baz')

product1.use
product2.use
product3.use

factory = CarFactory.new
product1 = factory.create('foo')
product2 = factory.create('bar')
product3 = factory.create('baz')

product1.use
product2.use
product3.use

puts factory.get_products_info
