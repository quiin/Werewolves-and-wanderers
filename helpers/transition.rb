=begin
	Samantha Ponce	A01370967
	Carlos Reyna 		A01165824
	Diego Monroy		A01165792
	Edgar López			A01372098
=end

class Transition
    attr_accessor :instruction, :id
    def initialize(instruction, id)
        @instruction = instruction
        @id = id
    end

    def to_s
    	"Instruction: #{@instruction}\nSection: #{@id}"
    end
end