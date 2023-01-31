
require 'pry'

class Player
  attr_accessor :name, :life_point
 
  def initialize(name_of_player) #
    @name = (name_of_player)
    @life_point = 10
  end

  def show_state
    if @life_point <= 0
      puts "#{@name} est mort ! Sorry xoxo" 
    else
      puts "#{@name} a #{@life_point} points de vie ! "
    end
  end

  def gets_damage(damage_number)
    @life_point = @life_point - damage_number
    puts "#{@name} est mort ! Sorry xoxo" if @life_point <= 0
  end

  def attacks(player_attacked)
    puts "Le joueur #{@name} est attaqué par le joueur #{player_attacked} !"
    damage = compute_damage
    @life_point = @life_point - damage
    puts "#{player_attacked} inflige #{damage} points de dommages à #{@name} !"
  end

  def compute_damage
    return rand(1..6)
  end
end
