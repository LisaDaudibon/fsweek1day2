
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
hooman_name = gets

hooman_player1 = HoomanPlayer.new(hooman_name)
player1 = Player.new("Voldemort")
player2 = Player.new("Lex Luther")

partner1 = Partner.new("Suziwan")
partner2 = Partner.new("Karine")

while hooman_player1.life_point > 0 && (player1.life_point > 0 || player2.life_point > 0)
  hooman_player1.show_state
  #menu
  puts "Quelle action veux-tu effectuer ?" #création d'un menu

  puts "a - Chercher une meilleure arme"
  puts "g - Chercher à se soigner ou à guérir "
  puts "s - Demander de l'aide à #{partner1.name}"
  puts "k - Demander de l'aide à #{partner2.name}"

  puts "Attaquer un joueur en vue :"
  print "0 - #{player1.show_state}"
  puts "1 - #{player2.show_state} \n"

  puts "e - pour quitter \n"
  
  print "Fais ton choix ou repends toi à tout jamais devant les dieux grecs et romains : "
  menu = gets
  if menu == "a"
    hooman_player1.search_weapon
  elsif menu == "s"
    hooman_player1.life_pack
  elsif menu == "1"
    hooman_player1.attacks(player1)
    player1.show_state
  elsif menu == "2"
    hooman_player1.attacks(player2)
  # elsif menu == "e"
  #   break
  else
    "Mais quel connard (ou connasse, faut pas discriminer), entre pas des commandes inconnus enfin voyons !"
  end

  #break 
end

puts "\n================ La partie est FIIIIIIINIIIIIIIIIIIIIIIIIEEE ! =================== \n"
puts
# if hooman_player1.life_point > 0
#   puts "~~~~~~~~~ La partie est trop GAGNE ! Tu as battu les robots ..... :D ~~~~~~~~~~"
# else
#   puts "_________ Tu as PERDU, les bots ont envahi le monde ! Quel loooooooooser !:'( __________"
# end
