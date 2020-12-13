require './game/memento'
require './game/gamer'

gamer = Gamer.new(100)
memento = gamer.create_memento

100.times do |i|
  puts "=== #{i}"
  puts "現状: #{gamer}"

  gamer.bet

  puts "所持金は#{gamer.money}円になりました"

  if gamer.money > memento.money
    puts "  (だいぶ増えたので、現在の状態を保存しておこう)"
    memento = gamer.create_memento
  elsif gamer.money < memento.money / 2
    puts "  (だいぶ減ったので、以前の状態に復元しよう)"
    gamer.restore_memento(memento)
  end

  sleep 1
  puts ""
end
