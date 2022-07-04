class ResponseError < StandardError
    def message
      'That is an invalide response. Try again.'
    end
end

# require_relative "./black_jack.rb"

class Player
    attr_accessor :player_hand, :score, :player_hand
    def initialize
        # @hit = hit
        @score = 0
        # @player_hand = Array.new
    end

    # def start_hand
    #     @player_hand.push(BlackJack.deck[0], BlackJack.deck[1])
    #     BlackJack.deck -= BlackJack.deck[0]
    #     BlackJack.deck -= BlackJack.deck[1]
    # end

    def player_move
        # begin
            puts player_hand
            puts player_score
            puts 'hit or stay'
            answer = gets.chomp

            if answer != 'hit' || answer != 'stay'
        # rescue ResponseError => e
            # puts e.message
        # retry
            end
        # end
    end

end

