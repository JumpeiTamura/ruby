require './printable'

class Printer
  include Printable

  def initialize(name)
    @name = name
    heavy_job("Printerのインスタンス#{name}を作成中")
  end

  def heavy_job(str)
    print str
    5.times do
      sleep 1
      print "."
    end
    puts "完了。"
  end

  def p_print str
    puts "=== #{name} ==="
    puts str
  end
end
