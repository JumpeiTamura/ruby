class Gamer
  attr_reader :money

  def initialize(money)
    @money = money
    @fruits = []
  end

  def bet
    dice = rand(6) + 1
    case dice
    when 1
      @money += 100
      puts "所持金が増えました"
    when 2
      @money /= 2
      puts "所持金が半分になりました"
    when 6
      f = get_fruit
      puts "フルーツ(#{f})をもらいました"
      @fruits << f
    else
      puts "何も起こりませんでした"
    end
  end

  def create_memento
    delicious_fruits = @fruits.select{|fruit| fruit.start_with? "おいしい"}
    Memento.new(@money, delicious_fruits)
  end

  def restore_memento(memento)
    @money = memento.money;
    @fruits = memento.fruits;
  end

  def to_s
    "[money = #{@money}, fruits = #{@fruits}]"
  end

  private

  def fruitsname
    %w(リンゴ ぶどう バナナ みかん)
  end

  def get_fruit
    prefix = ["", "おいしい"].sample
    fruitname = fruitsname.sample
    prefix + fruitname
  end
end
