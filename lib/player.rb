
require 'pry'

class Player
  attr_accessor :name, :life_point
  @@enemies = [] #on veut ranger tous les bots dans array

  def initialize(name_of_player) #c'est le début, on définit nos players, dans app2, c'est des bots, donc des enemies
    @name = (name_of_player)
    @life_point = 10
    @@enemies << self.name
  end

  def show_state #d'abord elle en où notre vie ? Il faut l'afficher, d'où cette méthode
    if @life_point <= 0
      puts "#{@name} est mort ! Sorry xoxo" 
    else
      puts "#{@name} a #{@life_point} points de vie ! "
    end
  end

  def gets_damage(damage_number) #elle sert pas à grand-chose mais on l'applique dans la def suivante donc bon
    @life_point = @life_point - damage_number
    puts "#{@name} est mort ! Sorry xoxo" if @life_point <= 0
  end

  def attacks(player_attacked) #enfin les choses sérieuses, on définit une variable d'attaque
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
  @@partners = []

  def initialize(name_of_player)
    @weapon_level = 1
    @@partners << Partner.name

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

class Partner < HoomanPlayer
  
  def initialize(name_of_player)
    super(name_of_player)
  end

  def potion_friend
    potion = 10
    @life_point = @life_point + 10 if @life_point <= 90
    puts "Ton #{@name} t'as passé en scred une potion ! Personne n'a rien vu parce qu'elle est super trop discrète <3 Ta vie est désormais égale #{life_point} "
  end

  def singing_friend
    puts "Ta pote est tellement cool qu'elle te chante une super chanson :" #elle chante 'Sous l'océan', de la petite sirène
    puts "Le roseau est toujours plus vert dans le marais d'à côté \n 
    Toi, t'aimerais bien vivre sur terre, bonjour la calamité \n
    Regarde bien le monde qui t'entoure dans l'océan parfumé \n
    On fait Carnaval tous les jours, mieux tu pourras pas trouver \n \n
    Sous l'océan, sous l'océan \n
    Doudou, c'est bien mieux, tout l'monde est heureux sous l'océan \n
    Là-haut, ils bossent toute la journée \n
    Esclavagés et prisonniers \n
    Pendant qu'on plonge comme des éponges sous l'océan (to doo dooo doo) \n"
    @weapon_level = @weapon_level + 2
    puts "Cela te donne un bonus de + 2 à ton niveau d'armes ! <3 Tu as désormais une arme de niveau #{weapon_level} ! Magnifique "
  end
end