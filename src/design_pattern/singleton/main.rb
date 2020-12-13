require 'bundler/setup'
require 'pry'
require_relative 'singletoncls'

obj1 = SingletonCls.get_instance
obj2 = SingletonCls.get_instance

if obj1 == obj2
  puts "同じインスタンスです"
else
  puts "違うインスタンスです"
end
