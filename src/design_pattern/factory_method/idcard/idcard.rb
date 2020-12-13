require_relative '../framework/product'

class IdCard < Product
  def initialize(owner)
    @owner = owner
    puts "#{@owner}のカードを作ります"
  end

  def use
    puts "#{@owner}のカードを使います"
  end

  def get_owner
    @owner
  end
end
