require './printable'
require './printer'

class PrinterProxy
  include Printable

  def initialize(str, printer_class:)
    # クラス内でsetter呼び出し
    self.name = str
    @printer_class = printer_class
  end

  def name=(str)
    @name = str
    @real&.name = str
  end

  def p_print str
    realize
    @real.p_print str
  end

  def realize
    @real = @printer_class.new(name)
  end
end
