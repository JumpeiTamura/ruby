require './visitor'

class FileFindVisitor < Visitor
  attr_reader :found_files

  def initialize(ext)
    @ext = ext
    @found_files = []
  end

  def visit_file(file)
    if Regexp.new("#{@ext}$").match? file.get_name
      @found_files << file
    end
  end

  def visit_dir(dir)
    dir.each do |entry|
      entry.accept(self)
    end
  end
end
