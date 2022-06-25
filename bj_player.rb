#Player Class - where we get user input and do most error handling, @player_score(attr_accessor)
#inst method for ace(if hand with 11 > 21 -> ace becomes 1)

class ResponseError < StandardError
    def message
      'That is an invalide response. Try again.'
    end
end


class Player
    attr_accessor :player_hand
    def initialize
        @hit = hit
        @player_score = 0
        @player_hand = Array.new
    end

    def score
        

    end

    def player_move
        begin
            puts player_hand
            puts player_score
            puts 'hit or stay'
            answer = gets.chomp
            if answer != 'hit' || answer != 'stay'
        rescue ResponseError => e
            puts e.message
        retry
            player_hand << @deck[0] if answer == 'hit'
            puts player_hand
            puts player_score
        end
    end

end

