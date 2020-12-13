require 'singleton'
require './bigchar'

class BigCharFactory
  include Singleton

  def initialize
    @bigchars = {}
  end

  def get_bigchar(char)
    @bigchars[char] ||= BigChar.new(char)
  end
end
