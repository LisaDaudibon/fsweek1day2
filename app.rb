
require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#binding.pry

player1 = Player.new("José")
player2 = Player.new("Lila")
player3 = HoomanPlayer.new("Lilian")

puts "Voici l'état de nos joueurs :" #le début du jeu, maintenant qu'on a créé nos personnages, on veut afficher leurs points de vie
player1.show_state
player2.show_state
puts player3.show_state

while player1.life_point > 0 && player2.life_point > 0
  puts "Passons à la phase d'attaque :" #ATTENTION, c'est le début des choses sérieuses, nous allons lancer nos premières attaques
  puts
  player1.attacks(player2)
  if player2.life_point <= 0 #par contre il faut être sûr que le player2 n'est pas mort avant d'attaquer sinon bonjour les ennuies avec une attaque zombie
    print player1.show_state #cette def inclus en elle même une condition qui indique si player1 est toujours en vie. Cela nous servira plus tard mais au moins vous savez !
    puts player2.show_state
    break
  else #ouf, player 2 est encore en vie, donc il peut attaquer
    puts player2.attacks(player1) 
  end
  puts "Voici l'état de nos joueurs :" #le résultat de nos attaques
  print player1.show_state
  puts player2.show_state
end
