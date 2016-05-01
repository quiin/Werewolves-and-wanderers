=begin
  Samantha Ponce  A01370967
  Carlos Reyna    A01165824
  Diego Monroy    A01165792
  Edgar López     A01372098
=end

require_relative 'transition'
require_relative 'section'

class Room < Section  
  def initialize(description, id)
    super(description,id)        
  end

  def to_s
    "Description: #{description}\nid: #{id}"
  end
end