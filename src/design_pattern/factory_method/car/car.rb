require_relative '../framework/product'

class Car < Product
  def initialize(owner, current_lot_number)
    @owner = owner
    @lot_number = current_lot_number
    puts "create #{@owner}'s car."
  end

  def use
    puts "#{@owner}'s car is running!"
  end

  def get_info
    {@lot_number => @owner}
  end
end
