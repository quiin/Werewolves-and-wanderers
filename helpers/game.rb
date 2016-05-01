=begin
	Samantha Ponce	A01370967
	Carlos Reyna 		A01165824
	Diego Monroy		A01165792
	Edgar López			A01372098
=end

require_relative 'room'
require_relative 'player'
require_relative 'transition'
require_relative 'combat'

class Game
	attr_accessor :player, :sections, :current_section

	def initialize
		@player = Player.new

		# --- Sections (Rooms/Combats) ---#
		start_section = Room.new("You are at the entrance of a forbidding-looking stone castle. You are facing east. The huge wooden entrance door stands lightly open. To enter the castle, type 'south'", 7)
		hallway_section = Room.new("You are in the hallway entrance to the castle. It is dark and gloomy, and the air of decay and desolation is very depressing. You suddenly feel very frightened. To go to the entrance, type 'north' or type 'east'  or 'south' to go to an adyacent room", 40)
		combat_section = Combat.new(@player, "A werewolf awakes in this room. He attacks you. Flip a coin. If it is heads, the werewolf has beaten you, otherwise you have killed it.", 
		"You have won 50 golden coins and your health goes up by 50.", "You lose 50 health points and 20 coins fall off your pockets.", [0], 1 ,[50, 50], [50, 20], 666)
		# --- MAGIC --- #
		magrathea_section = Room.new("You entered a very cool room. To the east, you see what it looks like a safe place. To the west, you see only darkness and despair. To the south... you just don't want to go there, m8. Type the direction you want to wander.",8)
		win_section = Room.new("You are bunkers, what did you smoke, Wanderer? You just found the secrets of life, love and everything. You got out of the castle and enjoyed your life\nA WINNER IS YOU!", 42)
		treasure_section = Room.new("There's nothing here", 22)
		dragon_combat = Combat.new(@player, "A big black D...ragon appears before you. He attacks you with his fire breath. Flip two coins; if both are the heads, you slay it; everything else you are pretty much dead.", "You are DA MAAAAAN, you won 3k gold and 25k HP.",  "You lost 200 gold and 1000 HP",[0], 2,[25000,3000], [1000, 200], 89)

	
		# --- Transitions --- #
		start_section.goes_to(Transition.new(:south, 40)) #hallway
		combat_section.goes_to(Transition.new(:west, 40)) #hallway
		
		hallway_section.goes_to(Transition.new(:north, 7)) #start
		hallway_section.goes_to(Transition.new(:east, 666)) #werewolf
		hallway_section.goes_to(Transition.new(:south, 8)) #magrathea
		
		magrathea_section.goes_to(Transition.new(:north,40)) #hallway
		magrathea_section.goes_to(Transition.new(:south, 22)) #treasure
		magrathea_section.goes_to(Transition.new(:east, 89)) #dragon
		magrathea_section.goes_to(Transition.new(:west,42)) #WIIIIIIN

		treasure_section.goes_to(Transition.new(:north, 8)) #magrathea
		combat_section.goes_to(Transition.new(:west, 8)) #magrathea

		@current_section = start_section
		@sections = []
		@sections << start_section << hallway_section	<< combat_section << magrathea_section << win_section << treasure_section << dragon_combat
	end

	def play	
		input = nil
		valid_input = false
		from_combat = false
		puts @current_section.description
		while input != :end	
			input = get_input unless from_combat
			from_combat = false
			if input == :stats
				puts @player.to_s
				puts @current_section.description
				next
			end
			#looks for input in transition's instructions
			@current_section.transitions.each do |transition|
				#valid instruction
				if transition.instruction == input
					new_section = search_for(transition.id)
					@current_section = new_section if new_section != -1	
					puts @current_section.description										
					valid_input = true
					if @current_section.is_a? Combat
						puts "Press enter to fight!"; gets						
						fight_result = @current_section.fight[:status]
						input = :west
						from_combat = true
						if @player.is_dead?
							puts "You won't be wandering anymore, fellow Wanderer. You are DEAD."
							exit
						end
					elsif @current_section.id == 42
							puts @player.to_s
							puts "Score: #{@player.score}"				
							exit
					end
					break					
				end
				valid_input = false
			end
			unless valid_input
				puts "Invalid instruction, fellow Wanderer"	
				puts @current_section.description
			end
		end	
	end

	def get_input
		gets.chomp!.downcase.to_sym
	end

	def search_for (target)
		@sections.each do |section|
			return section if section.id == target
		end
		return -1
	end	
	
end

Game.new.play