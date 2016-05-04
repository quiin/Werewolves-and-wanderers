=begin
  Samantha Ponce  A01370967
  Carlos Reyna    A01165824
  Diego Monroy    A01165792
  Edgar López     A01372098
=end

class Combat < Section
  attr_reader :winDescription, 
              :loseDescription,
              # player stats
              :winnerNumber, 
              :numberOfCoins, 
              # ( strength, gold )
              :winningItems, 
              :losingItems
  attr_accessor :player
  STRENGTH = 0
  GOLD = 1
  
  def initialize (player, description, winDescription, loseDescription, winnerNumber, numberOfCoins, winningItems, losingItems, id)
    super(description,id)
    @player = player    
    @winDescription = winDescription
    @loseDescription = loseDescription
    @winnerNumber = winnerNumber
    @numberOfCoins = numberOfCoins
    @winningItems = winningItems
    @losingItems = losingItems
    @coins = []
  end
  
  def fight
    combatNumber = 0
    for n in (0..numberOfCoins-1)
      flip = @player.flip_coin
      @coins << flip[:desc]
      combatNumber += flip[:num]
    end
    for c in winnerNumber
      if c == combatNumber
        puts(@winDescription)
        @player.cure(@winningItems[STRENGTH]).loot(@winningItems[GOLD]).kill
        return ({player: @player, status: 1, desc: @winDescription, throws: @coins})
      end
    end
    puts(@loseDescription)
    @player.damage(@losingItems[STRENGTH]).lose(@losingItems[GOLD])
    return ({player: @player, status: 0, desc: @loseDescription, throws: @coins})
  end
  
end