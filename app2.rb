

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
player1 = gets

player2= Player.new("Victor")
player3= Player.new("Nasser")

