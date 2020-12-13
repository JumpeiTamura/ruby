require 'stringio'
require './visitor'

class ListVisitor < Visitor
  def initialize
    @current_dir = ""
  end

  def visit_file(file)
    puts "#{@current_dir}/#{file.to_s}"
  end

  def visit_dir(dir)
    puts "#{@current_dir}/#{dir.to_s}"
    @current_dir = "#{@current_dir}/#{dir.get_name}"
    saved_dir = @current_dir
    dir.each do |entry|
      @current_dir = saved_dir
      entry.accept(self)
    end
  end
end
