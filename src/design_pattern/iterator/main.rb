require 'bundler/setup'
require 'pry'
Dir["lib/*.rb"].each{|file| require_relative file}

book_shelf = BookShelf.new

book_shelf.append(Book.new('hoge'))
book_shelf.append(Book.new('foo'))
book_shelf.append(Book.new('bar'))
book_shelf.append(Book.new('baz'))

it = book_shelf.iterator

while it.has_next? do
  book = it.next
  puts book.name
end
