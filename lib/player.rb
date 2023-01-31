
require 'pry'

class Player
  attr_accessor :name, :life_point
 
  def initialize(name_of_player) #
    @name = (name_of_player)
    @life_point = 10
  end

  def show_state
    # if @life_point <= 0
    #   puts "#{@name} est mort ! Sorry xoxo" 
    # else
      puts "#{@name} a #{@life_point} points de vie ! "
    # end
  end

  def gets_damage(damage_number)
    @life_point = @life_point - damage_number
    puts "#{@name} est mort ! Sorry xoxo" if @life_point <= 0
    return @life_point
  end

  def attacks(player_attacked)
    puts "Le joueur #{@name} attaque le joueur #{player_attacked} !"
    damage = compute_damage
    player_attacked.gets_damage(damage)
    puts "#{@name} inflige #{damage} points de dommages à #{player_attacked} !"
  end

  def compute_damage
    return rand(1..6)
  end
end

# class HoomanPlayer < Player
#   attr_accessor :weapon_level
 
#   def initialize(name_of_player)
#     @weapon_level = 1

#     super(name_of_player)
#     @life_point = 100
#   end

#   def show_state
#     puts "#{@name} a #{@life_point} points de vie et une arme de niveau #{@weapon_level} !"
#   end

#   def compute_damage
#     return rand(1..6) * @weapon_level
#   end
  
#   def search_weapon
#     new_weapon_level = compute_damage
#     puts "Tu as trouvé une arme de niveau #{new_weapon_level} ! <3 Bien joué, joueur incroyable ^^"
#     if new_weapon_level > @weapon_level
#       return @weapon_level = new_weapon_level
#       puts "Tu as trouvé une arme de batard !"
#     else
#       puts "Dommage, mon coco ! Mais au moins, tu vas garder ton arme parce qu'elle est déjà grave cool !"
#     end
#   end

#   # def life_pack
#   #   life_pack_random = @compute_damage
#   #   if life_pack_random = 1
#   #     puts "Tu n'as rien trouvé ... Pas de chance, n'hésite pas à réessayer <3 Ne perds pas confiance !"
#   #   elsif life_pack_random > 2 && life_pack_random < 5
      
#   #     puts ""    
#   #   end
#   # end

# end
