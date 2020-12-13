class BookShelfIterator
  def initialize(book_shelf)
    @book_shelf = book_shelf
    @index = 0
  end

  def next
    book = book_shelf.get(@index)
    @index += 1
    book
  end

  def has_next?
    @index < book_shelf.size
  end

  private

  attr_reader :book_shelf
end
