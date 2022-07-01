class Dealer
    attr_accessor :dealer_score, :dealer_hand
   def initialize
      @hit = hit
      @score = 0
      @dealer_hand = Array.new
   end

   def start_hand
      @player_hand.push(BlackJack.deck[0], BlackJack.deck[1])
      BlackJack.deck -= BlackJack.deck[0]
      BlackJack.deck -= BlackJack.deck[1]
   end

   
end


