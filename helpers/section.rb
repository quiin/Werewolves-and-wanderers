=begin
	Samantha Ponce	A01370967
	Carlos Reyna 		A01165824
	Diego Monroy		A01165792
	Edgar López			A01372098
=end

class Section
	attr_reader :id, :description, :transitions
	def initialize(description = "Starting room", id = 7, transitions = [])
		@description = description
		@id = id
		@transitions = transitions
	end

	def goes_to(trans)
  	transitions.push(trans)
  end
	
end