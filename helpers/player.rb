=begin
	Samantha Ponce	A01370967
	Carlos Reyna 		A01165824
	Diego Monroy		A01165792
	Edgar López			A01372098
=end

class Player
	attr_reader :health,:wealth,:monster_tally

	def initialize
		@health = 50
		@wealth = 50
		@monster_tally = 0
	end

	def flip_coin
		val = rand(1000)
		if(val % 2 == 0)
			puts "You tossed Heads"
			{num:0, desc:"You tossed Heads"} 	#0 is Heads
		else
			puts "You tossed Tails"
			{num: 1, desc:"You tossed Tails"} 	#1 is Tails
		end
	end

	def is_dead?
		@health <= 0
	end

	def damage (n)
		x = n.class == Float
		if(!x)
			@health -= n
		else
			@health *= n
		end
		return self
	end

	def cure (n)
		x = n.class == Float
		if(!x)
			@health += n
		else
			@health *= (1+n)
		end
		return self
	end

	def loot (n)
		x = n.class == Float
		if(!x)
			@wealth += n
		else
			@wealth *= (1+n)
		end
		return self
	end

	def score
		@health + @wealth + @monster_tally
	end

	def lose (n)
		x = n.class == Float
		if(!x)
			@wealth -= n
		else
			@wealth *= n
		end
		return self
	end

	def kill
		@monster_tally+= 1
		return self
	end

	def to_s
		"Health: #{health}\nMoneys: #{wealth}\nMonsters Slain: #{monster_tally}"
	end

end