class SingletonCls
  def self.get_instance
    @@instance
  end

  private

  @@instance = new

  def initialize
    puts "インスタンスを生成しました"
  end
end
