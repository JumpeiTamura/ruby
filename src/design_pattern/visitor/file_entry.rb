require './entry'

class FileEntry < Entry
  def initialize(name, size)
    @name = name
    @size = size
  end

  def get_size
    @size
  end

  def get_name
    @name
  end

  def accept(visitor)
    visitor.visit_file(self)
  end
end
