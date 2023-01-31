
require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#binding.pry

player1 = Player.new("José")
player2 = Player.new("Lila")
player3 = HoomanPlayer.new("Lilian")

puts "Voici l'état de nos joueurs :"
player1.show_state
player2.show_state
puts player3.show_state

while player1.life_point > 0 && player2.life_point > 0
  puts "Passons à la phase d'attaque :"
  puts
  player1.attacks(player2)
  if player2.life_point <= 0
    print player1.show_state
    puts player2.show_state
    break
  else
    puts player2.attacks(player1)
  end
  puts "Voici l'état de nos joueurs :"
  print player1.show_state
  puts player2.show_state
end
