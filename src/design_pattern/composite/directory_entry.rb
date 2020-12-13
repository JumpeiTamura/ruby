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

  def print_list(prefix)
    path = "#{prefix}/#{get_name}"
    puts "#{path}(#{get_size})"
    @children.each do |child|
      child.print_list(path)
    end
  end

  def has_file?(file)
    has_file = false
    @children.each do |child|
      has_file ||= child.has_file?(file)
    end
    has_file
  end

  def get_rel_path(file, prefix)
    rel_path = prefix
    rel_path += "/#{get_name}" if has_file? file
    @children.each do |child|
      got_rel_path = child.get_rel_path(file, rel_path)
      rel_path = got_rel_path if rel_path.size < got_rel_path.size
    end
    rel_path
  end
end
