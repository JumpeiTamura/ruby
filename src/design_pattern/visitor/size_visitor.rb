require './visitor'

class SizeVisitor < Visitor
  def initialize
    @size = 0
  end

  def visit_file(file)
    @size += file.get_size
  end

  def visit_dir(dir)
    dir.each do |entry|
      entry.accept(self)
    end
  end

  def get_size
    @size
  end
end
