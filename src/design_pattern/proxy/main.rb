require './printer_proxy'

p = PrinterProxy.new("Alice", printer_class: Printer)
puts "名前は現在#{p.name}です。"
p.name = "Bob"
puts "名前は現在#{p.name}です。"
p.p_print "Hello, world."
