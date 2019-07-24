require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------
|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
|Le but du jeu est d'être le dernier survivant !|
-------------------------------------------------"
puts "Entrez votre nom"
print ">"
humanplayer_name = gets.chomp
humanplayer = HumanPlayer.new("#{humanplayer_name}")
puts "Bienvenue #{humanplayer_name}"
puts "Voici la liste de tes ennemies :"

player1 = Player.new("Josiane")
player2 = Player.new("José")
enemies = [player1, player2]
enemies.each {|player| puts player.name}

while humanplayer.life_points >0 && (player1.life_points > 0 || player2.life_points >0)
	puts " Votre état actuel est #{humanplayer.life_points} point de vie"
	puts "tandis que l'état de votre adversaire est"
	print "#{player1.show_state} et "
	puts "#{player2.show_state}"

	puts "A vous d'attaquer"
	puts "Appuyez sur entrer pour continuez!"
answer = gets.chomp

	puts "Que voulez-vous faire : \n A = Attaquer Josiane, \n B = Attaquer José, \n X = Améliorer votre arme, \n V = Cherchez vie"
	print "(A/B/X/V) >>>>"

	@command = gets.chomp.to_s
	
		if @command == "A"
			humanplayer.attacks(player1)
			puts "#{humanplayer_name} a attaqué Josiane et en effet:"
			puts player1.show_state
		elsif @command == "B"
			humanplayer.attacks(player2)
			puts "#{humanplayer_name} a attaqué José et en effet:"
			puts player2.show_state
		elsif @command  == "X"
			humanplayer.search_weapon
		elsif @command == "V"
			humanplayer.search_health_pack
		end
	puts "C'est au tour des autres joueurs t'attaquer"
	puts "Appuyez sur entrer pour continuez!"
answer = gets.chomp
	puts "Les autres joueurs t'attaquent !"
	enemies.each {|player|
		if player.life_points < 1
			puts "#{player.name} est déja mort"
		else
		player.attacks(humanplayer)
		end}
puts "voici votre nouvelle etat, #{humanplayer.life_points} point de vie!"
puts "Appuyez sur entrer pour continuez!"
answer = gets.chomp
puts "#{answer}? , continuont alors!"
puts " "
puts "***************NOUVELLE ROUNDE*************"
puts " "

end

puts "**********************************"
puts "*** La partie est finie ***"
if humanplayer.life_points > 0
  puts "BRAVO ! TU AS GAGNE !"
else
  puts "Loser ! Tu as perdu !"
end
puts "**********************************"



binding.pry