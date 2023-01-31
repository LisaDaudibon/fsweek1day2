
require 'pry'

class Player
  attr_accessor :name, :life_point
  @@enemies = []

  def initialize(name_of_player) #
    @name = (name_of_player)
    @life_point = 10
    @@enemies << self.name
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
    puts "Le joueur #{@name} attaque le joueur #{player_attacked.name} !"
    damage = compute_damage
    player_attacked.gets_damage(damage)
    puts "#{@name} lui inflige #{damage} points de dommages !"
  end

  def compute_damage
    rand(1..6)
  end
end

class HoomanPlayer < Player
  attr_accessor :weapon_level
 
  def initialize(name_of_player)
    @weapon_level = 1

    super(name_of_player)
    @life_point = 100
  end

  def show_state
    puts "#{@name} a #{@life_point} points de vie et une arme de niveau #{@weapon_level} !"
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end
  
  def search_weapon
    new_weapon_level = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{new_weapon_level} ! <3 Bien joué, padawan de tout âge ^^"
    if new_weapon_level > @weapon_level
      @weapon_level = new_weapon_level
      puts "Tu as trouvé une arme de batard !"
    else
      puts "Dommage, mon coco ! Mais au moins, tu vas garder ton arme parce qu'elle est déjà grave cool !"
    end
  end

  def life_pack
    life_pack_random = rand(1..6)
    puts life_pack_random
    if life_pack_random == 1
      puts "Tu n'as rien trouvé ... Pas de chance, n'hésite pas à réessayer <3 Ne perds pas confiance !"
    elsif life_pack_random >= 2 && life_pack_random <= 5
      @life_point = @life_point + 50
      puts "Bravo, tu as trouvé un pack de 50 points de vie ! Tu as désormais #{@life_point} points de vie !"
    elsif life_pack_random == 6
        @life_point = @life_point + 80
      puts "Bravo, tu as trouvé un pack de 80 points de vie, quel bg ! Tu as désormais #{@life_point} points de vie ! Tu vas vivre super longtemps <3"
    end
    if @life_pack > 100
      @life_pack = 100
    end
  end

end
