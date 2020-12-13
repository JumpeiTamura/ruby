module Printable
  attr_accessor :name
    
  def p_print str
    raise NotImplementedError
  end
end
