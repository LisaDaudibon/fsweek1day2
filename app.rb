
require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#binding.pry

player1 = Player.new("José")
player2 = Player.new("Lila")
# player3 = HoomanPlayer.new("Lilian")

puts "Voici l'état de nos joueurs :"
player1.show_state
player2.show_state
# puts player3.show_state

player1.attacks("#{player2.name}")

# while player1.life_point > 0 && player2.life_point > 0
#   puts "Passons à la phase d'attaque :"
#   puts
#   player1.attacks("#{player2.name}")
#   if player2.life_point <= 0
#     puts "Voici l'état de nos joueurs :"
#     print player2.show_state
#     puts "#{player1.name} est very very deadza ! "
#     break
#   elsif player1.life_point <= 0
#     puts "Voici l'état de nos joueurs :"
#     print player1.show_state
#     puts "#{player2.name} est very very deadza ! "
#     break
#   else 
#     puts player2.attacks("#{player1.name}")
#   end
#   puts "Voici l'état de nos joueurs :"
#   print player1.show_state
#   puts player2.show_state
# end

#player3.search_weapon