require './file_entry'
require './directory_entry'

root_dir = DirectoryEntry.new("root")
tmp_dir = DirectoryEntry.new("tmp")
bin_dir = DirectoryEntry.new("bin")
usr_dir = DirectoryEntry.new("usr")
root_dir.add(tmp_dir)
root_dir.add(bin_dir)
root_dir.add(usr_dir)

rb_file = FileEntry.new("ruby.exe", 20000)
py_file = FileEntry.new("python.exe", 30000)

bin_dir.add(rb_file)
bin_dir.add(py_file)

puts root_dir.get_size

root_dir.print_list("")

puts root_dir.has_file?(py_file)
puts tmp_dir.has_file?(py_file)
puts bin_dir.has_file?(py_file)

puts root_dir.get_rel_path(py_file, "")
