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

  def print_list(prefix)
    puts "#{prefix}/#{get_name}(#{get_size})"
  end

  def has_file?(file)
    file == self
  end

  def get_rel_path(file, prefix)
    rel_path = prefix
    rel_path += "/#{get_name}" if has_file? file
    rel_path
  end
end
