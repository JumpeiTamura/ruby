require './file_entry'
require './directory_entry'
require './list_visitor'
require './file_find_visitor'
require './size_visitor'

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

root_dir.accept(ListVisitor.new)
puts

hanakos_dir = DirectoryEntry.new("hanako")
taros_dir = DirectoryEntry.new("taro")
usr_dir.add(hanakos_dir)
usr_dir.add(taros_dir)

hanakos_dir.add(FileEntry.new("memo.txt", 100))
hanakos_dir.add(FileEntry.new("memo.html", 200))
taros_dir.add(FileEntry.new("hoge.txt", 200))
taros_dir.add(FileEntry.new("hoge.html", 300))

root_dir.accept(ListVisitor.new)
puts

ffv = FileFindVisitor.new(".html")
root_dir.accept(ffv)
ffv.found_files.each do |file|
  puts file.to_s
end
puts

sv_root = SizeVisitor.new
sv_usr = SizeVisitor.new
root_dir.accept(sv_root)
usr_dir.accept(sv_usr)

puts sv_root.get_size
puts sv_usr.get_size
