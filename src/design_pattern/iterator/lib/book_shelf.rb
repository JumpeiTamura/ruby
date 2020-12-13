class BookShelf
  def initialize(books=[])
    @books = books
  end

  def get(index)
    books[index]
  end

  def append(book)
    books.push book
  end

  def size
    books.size
  end

  def iterator
    BookShelfIterator.new(self)
  end

  private

  attr_reader :books
end
