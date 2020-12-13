class Memento
  attr_reader :money, :fruits

  def initialize(money, fruits)
    @money = money
    @fruits = fruits
  end
end
