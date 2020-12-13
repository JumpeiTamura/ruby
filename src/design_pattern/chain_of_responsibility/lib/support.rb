class Support
  attr_reader :next_support

  def initialize(name)
    @name = name
    @next_support = nil
  end

  def set_next(next_support)
    @next_support = next_support
  end

  def support(trouble)
    expand_supports.each do |support|
      if support.resolve(trouble)
        puts "#{trouble} is resolved by #{support}."
        return
      end
    end
    puts "#{trouble} cannot resolve."
  end

  def to_s
    "[support #{@name}]"
  end

  def resolve(trouble)
    raise 'not implemented'
  end

  private

  def expand_supports
    supports = []
    supports << self
    supports << next_support if next_support
    support = next_support
    while true
      next_support_obj = support.next_support
      break unless next_support_obj
      supports << next_support_obj
      support = next_support_obj
    end
    supports
  end
end
