

require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#binding.pry


puts "\n                -------------------------------------------------"
puts "                |Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "                |Le but du jeu est d'être le dernier survivant !|"
puts "                -------------------------------------------------\n"
"\n"
print " Quel est ton petit nom, Padawan ? "
houman_name = gets

houman_player1 = HoomanPlayer.new(houman_name)
player1 = Player.new("Victor")
player2 = Player.new("Nasser")

while houman_player1.life_point > 0 && (player1.life_point > 0 || player2.life_point > 0)
  houman_player1.show_state
  #menu
  puts "Quelle action veux-tu effectuer ?"

  puts "a - Chercher une meilleure arme"
  puts "s - Chercher à se soigner \n"

  puts "Attaquer un joueur en vue :"
  print "0 - #{player1.show_state}"
  puts "1 - #{player2.show_state} \n"

  puts "e - pour quitter \n"
  
  print "Fais ton choix ou repends toi à tout jamais devant les dieux grecs et romains : "
  menu = gets
  if menu == "a"
    houman_player1.search_weapon
  elsif menu == "s"
    houman_player1.life_pack
  elsif menu == "1"
    houman_player1.attacks(player1)
  elsif menu == "2"
    houman_player1.attacks(player2)
  elsif menu == "e"
    break
  else
    "Mais quel connard (ou connasse, faut pas discriminer), entre pas des commandes inconnus enfin voyons !"
  end

  break
end

puts "La partie est FIIIIIIINIIIIIIIIIIIIIIIIIEEE ! \n"
# if houman_player1.life_point > 0
#   puts "La partie est trop GAGNE ! Tu as battu les robots ....."
# else
#   puts "Tu as PERDU, les bots ont envahi le monde ! Quel loooooooooser !"
# end
