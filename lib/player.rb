class Player
	attr_accessor :name, :life_points

	def initialize(name)
		@name = name
		@life_points = 10
	end

	def show_state
		@state = life_points
		puts "#{@name} a #{@state} points de vie"
	end
	
	def gets_damage(damage_number)
		@life_points -= damage_number
		puts "le joueur #{@name} a été tué !" if @life_points <= 0
	end

	def attacks(player2)
		puts "#{@name} attaque #{player2.name}"
		@damage_received = player2.compute_damage 
		player2.life_points -= @damage_received
		puts "il lui inflige #{@damage_received} points de dommages"
		puts "le joueur #{player2.name} a été tué !" if player2.life_points < 0
	end

	def compute_damage
		return rand(1..6)
	end
end

class HumanPlayer < Player
	attr_accessor :weapon_level

	def initialize(name, weapon_level)
		@name = name
		@life_points = 100
		@weapon_level = 1
	end

	def show_state
		puts "#{name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
	end
end
