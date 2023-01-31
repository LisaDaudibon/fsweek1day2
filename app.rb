
require_relative 'lib/game'
require_relative 'lib/player'

#binding.pry

player1 = Player.new("José")
player2 = Player.new("Lila")

puts "Voici l'état de nos joueurs :"
#print 
player1.show_state
puts player2.show_state

while player1.life_point > 0 && player2.life_point > 0
  puts "Passons à la phase d'attaque :"
  puts
  player1.attacks("Lila")
  if player2.life_point < 0 || player1.life_point < 0
    break
  else 
    puts player2.attacks("José")
  end
  puts "Voici l'état de nos joueurs :"
  print player1.show_state
  puts player2.show_state
end
