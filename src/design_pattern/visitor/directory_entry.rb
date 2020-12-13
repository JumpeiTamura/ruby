require './entry'

class DirectoryEntry < Entry
  def initialize(name)
    @name = name
    @children = []
  end

  def add(entry)
    @children << entry
  end

  def get_size
    size = 0
    @children.each do |child|
      size += child.get_size
    end
    size
  end

  def get_name
    @name
  end

  def accept(visitor)
    visitor.visit_dir(self)
  end

  def each
    @children.each do |child|
      yield child
    end
  end
end
