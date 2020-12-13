require 'singleton'
require './concrete_static_id_generator'
require './concrete_serial_id_generator'

class IdGeneratorFactory
  include Singleton

  def initialize
    @generator_class_map = {
      static: ConcreteStaticIdGenerator,
      serial: ConcreteSerialIdGenerator
    }
    @generator_map = Hash.new { |h,k| h[k] = {} }
  end

  def fetch(generator_type, key)
    generator_class = generator_class_map[generator_type]
    generator_map[generator_type][key] ||= generator_class.new(key)
  end

  private
  attr_reader :generator_class_map, :generator_map
end
